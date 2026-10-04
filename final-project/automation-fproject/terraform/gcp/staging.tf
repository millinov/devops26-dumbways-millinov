resource "google_compute_instance" "gateway_fproject" {
    name         = "web-server-fproject"
    machine_type = var.gcp_machine_micro

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

resource "google_compute_disk" "db_disk" {
  name = "database-disk"
  type = var.gcp_disk_type
  size = var.gcp_disk_size
  zone = var.gcp_zone
}

resource "google_compute_instance" "db_fproject" {
    name         = "db-fproject"
    machine_type = var.gcp_machine_micro

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

resource "google_compute_attached_disk" "db_disk_attach" {
  disk     = google_compute_disk.db_disk.id
  instance = google_compute_instance.db_fproject.id
  device_name = google_compute_disk.db_disk.name
}

resource "google_compute_instance" "appserver_fproject" {
    count        = 2
    name         = "appserver-fproject-${count.index + 1}"
    machine_type = var.gcp_machine_small

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