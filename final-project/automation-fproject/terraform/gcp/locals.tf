locals {
    network = google_compute_network.fproject_network.id

    ports = [
        "22",        # Buat port SSH lama
        "80",        # Buat HTTP
        "443",       # Buat https
        "2379-2380", # Buat K3S
        "3000",      # Buat aplikasi dan grafana
        "3333",      # Buat port SSH baru
        "3389",      # Buat RDP untuk IAP TCP forwarding
        "5000",      # Buat backend aplikasi
        "5001",      # Buat K3S
        "5432",      # Buat DB menggunakan PostgreSQL
        "6443",      # Buat K3S
        "8080",      # Buat cAdvisor
        "9000",      # Buat Sonarqube
        "9090",      # Buat Prometheus
        "9100",       # Buat Node Exporter
        "10250",     # Buat K3S
    ]

    k3s = [
        "8472",
        "51820",
        "51821"
    ]
}