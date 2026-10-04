terraform {
    required_providers {
        google = {
        source  = "hashicorp/google"
        version = "6.8.0"
        }
    }
}

resource "google_compute_network" "fproject_network" {
    name = "final-project-network"
}

resource "google_compute_address" "build_vm_static_ip" {
    name   = "build-vm-static-ip"
    region = var.gcp_region
}

resource "google_compute_router" "router_fproject" {
  name    = "final-project-router"
  region  = var.gcp_region
  network = local.network
}

resource "google_compute_router_nat" "fproject_nat" {
  name   = "final-project-nat"
  router = google_compute_router.router_fproject.name
  region = var.gcp_region

  nat_ip_allocate_option = "AUTO_ONLY"

  source_subnetwork_ip_ranges_to_nat = "ALL_SUBNETWORKS_ALL_IP_RANGES"
}

resource "google_compute_project_metadata" "metadata_fproject" {
  metadata = {
        ssh-keys = "${var.ssh_user}:${file(var.ssh_pub_key)}"
  }
}