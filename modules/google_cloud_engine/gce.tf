resource "google_compute_instance" "my_compute_instance" {
  name         = var.compute_instance_name
  machine_type = var.compute_instance_type
  zone         = var.zone

  boot_disk {
    initialize_params {
      image = var.image.debian10
    }
  }

  network_interface {
    network    = google_compute_address.internal_with_subnet_and_address.network
    subnetwork = google_compute_address.internal_with_subnet_and_address.subnetwork
  }

  metadata_startup_script = "sudo apt update; sudo apt install nginx -y; curl -I 127.0.0.1"
}

resource "google_compute_address" "internal_with_subnet_and_address" {
  name         = var.internal_address
  subnetwork   = var.subnet_id
  address_type = var.address_type
  address      = var.instance_ip
  region       = var.region
}

resource "google_compute_disk" "gce_disk" {
  name = var.disk_name
  size = var.disk_size
  type = var.disk_type
  zone = var.zone
}

resource "google_compute_attached_disk" "default" {
  disk     = google_compute_disk.gce_disk.id
  instance = google_compute_instance.my_compute_instance.id
}