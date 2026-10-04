resource "google_compute_firewall" "network_rules" {
    name        = "allow-internal"
    network     = local.network
    priority = 2000

    allow {
        protocol = "tcp"
        ports = local.ports
    }

    allow {
        protocol = "udp"
        ports = local.k3s
    }

    source_ranges = [
            "10.184.0.0/24",      # Hanya bisa di akses internal
            "35.235.240.0/20", # Source IP Range IAP
            var.my_ip_address  # Personal IP Address
        ]
}

resource "google_compute_firewall" "app_rules" {
    name        = "allow-all-range"
    network     = local.network
    description = "So VM can be accessed by all"
    priority = 1000

    allow {
        protocol = "tcp"
        ports = local.ports
    }
    
    allow {
        protocol = "udp"
        ports = local.k3s
    }

    source_ranges = ["0.0.0.0/0"]
    
    target_tags = ["allow-all-range"]
}