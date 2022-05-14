# https://github.com/terraform-google-modules/terraform-google-network
# https://github.com/terraform-google-modules/terraform-google-cloud-nat/tree/v2.2.0/examples/nat_with_gke

# [START vpc_network_nat_gce]
module "vpc-module" {
  source       = "terraform-google-modules/network/google"
  version      = "~> 5.0"
  project_id   = var.project
  network_name = var.vpc_name
  mtu          = 1460

  subnets = [
    {
      subnet_name   = var.subnet_name
      subnet_ip     = var.subnet_ip
      subnet_region = var.region
    }
  ]
}
# [END vpc_network_nat_gce]

# [START vpc_firewall_nat_gce]
resource "google_compute_firewall" "rules" {
  project = var.project
  name    = var.firewall_name
  network = var.vpc_name
  allow {
    protocol = "tcp"
    ports    = ["22"]
  }
  source_ranges = ["0.0.0.0/0"]
}
# [END vpc_firewall_nat_gce]

# [START cloudnat_router_nat_gce]
resource "google_compute_router" "router" {
  project = var.project
  name    = var.router_name
  network = var.vpc_name
  region  = var.region
}
# [END cloudnat_router_nat_gce]

# [START cloudnat_nat_gce]
module "cloud-nat" {
  source                             = "terraform-google-modules/cloud-nat/google"
  version                            = "~> 2.2.0"
  project_id                         = var.project
  region                             = var.region
  router                             = google_compute_router.router.name
  name                               = var.nat_name
  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}
# [END cloudnat_nat_gce]

module "gce" {
  source                = "./modules/google_cloud_engine"
  project               = var.project
  compute_instance_name = var.compute_instance_name
  region                = var.region
  zone                  = var.zone
  compute_instance_type = var.compute_instance_type
  image                 = var.image
  subnet_id             = module.vpc-module.subnets_names[0]
  instance_ip           = var.instance_ip
}