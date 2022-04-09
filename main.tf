resource "google_storage_bucket" "static-site" {
  name          = var.bucket_name
  location      = var.bucket_multi_region.Europe
  force_destroy = true

  uniform_bucket_level_access = true
}


resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = "f1-micro"

  boot_disk {
    initialize_params {
      image = var.image.debian9
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "sudo apt update; sudo apt install nginx -y; curl -I 127.0.0.1"

}

variable "bucket_name" {
  default = "hillel-18-serhieiev"
}

variable "vm_name" {
  default = "test-vm-serhieiev"
}

variable "image" {
  type = map(any)
  default = {
    "debian9"  = "debian-9-stretch-v20220406"
    "debian10" = "debian-10-buster-v20220406"
  }
}

variable "bucket_multi_region" {
  type = map(any)
  default = {
    "Europe"      = "EU"
    "Americas"    = "US"
    "PasificAsia" = "ASIA"
  }
}

output "bucket_url" {
  value = google_storage_bucket.static-site.url
}

output "external_ip" {
  value = google_compute_instance.default.network_interface.0.access_config.0.nat_ip
}