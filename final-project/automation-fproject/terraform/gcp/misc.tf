resource "google_compute_instance" "monitor_fproject" {
    name         = "monitor-fproject"
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
    }   
}

resource "google_compute_instance" "cicd_fproject" {
    count        = 2
    name         = "cicd-fproject-${count.index + 1}"
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
    }
}

resource "google_compute_instance" "build_fproject" {
    name         = "build-fproject"
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
            nat_ip = google_compute_address.build_vm_static_ip.address
        }
    }
}