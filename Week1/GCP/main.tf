terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "3.5.0"
    }
  }
}

provider "google" {
  credentials = file(var.credentials_file)

  project = var.project
  region  = var.region
  zone    = var.zone
}

resource "google_compute_network" "vpc_network" {
  name                    = "test-network"
  auto_create_subnetworks = false
}


resource "google_compute_subnetwork" "subnet" {
  name    = "test-subnetwork"
  ip_cidr_range = "10.2.0.0/16"
  region        = "europe-north1"
  network = google_compute_network.vpc_network.id

}