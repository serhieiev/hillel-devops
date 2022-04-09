terraform {
  required_providers {
    google = {
      version = "4.15.0",
      source  = "hashicorp/google"
    }
  }
}

provider "google" {
  project     = ""
  region      = ""
  zone        = ""
  credentials = ""
}