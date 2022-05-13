resource "google_storage_bucket" "static-site" {
  name          = var.bucket_name
  location      = var.bucket_multi_region.Europe
  force_destroy = true

  uniform_bucket_level_access = true
}


resource "google_compute_instance" "default" {
  name         = var.vm_name
  machine_type = var.instance_type

  boot_disk {
    initialize_params {
      image = var.image.debian9
    }
  }

  network_interface {
    network = var.network

    access_config {
      // Ephemeral public IP
    }
  }

  metadata_startup_script = "sudo apt update; sudo apt install nginx -y; curl -I 127.0.0.1"

}



