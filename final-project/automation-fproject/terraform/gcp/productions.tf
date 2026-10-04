resource "google_compute_instance" "kube_master" {
    name         = "kube-master"
    machine_type = var.gcp_machine_medium

    boot_disk {
        initialize_params {
            image = var.gcp_disk_image # ubuntu 24
            size = var.gcp_disk_size # 20 giga
            type = var.gcp_disk_type # balanced
        }
    }
    
    allow_stopping_for_update = true 
    tags = [
        "lb-health-check", # Load balance health check dari GCP
        "allow-all-range", # Bisa di akses semua
    ]

    network_interface {
        network = local.network
        access_config {
        }
    }
}

resource "google_compute_instance" "kube_worker" {
    count        = 2
    name         = "kuber-worker-${count.index + 1}"
    machine_type = var.gcp_machine_medium

    boot_disk {
        initialize_params {
            image = var.gcp_disk_image # ubuntu 24
            size = var.gcp_disk_size # 20 giga
            type = var.gcp_disk_type # balanced
        }
    }
    
    allow_stopping_for_update = true 
    tags = [
            "lb-health-check" # Load balance health check dari GCP
        ]

    network_interface {
        network = local.network
        access_config {
        }
    }
}