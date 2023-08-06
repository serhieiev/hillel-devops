terraform {
  required_providers {
    google = {
      version = "4.19.0"
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project     = var.project
  credentials = var.key
  region      = var.region
  zone        = var.zone
}

provider "google-beta" {
  project     = var.project
  credentials = var.key
  region      = var.region
  zone        = var.zone
}