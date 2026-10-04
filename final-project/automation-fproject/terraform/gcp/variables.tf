variable "gcp_project_name" {
  type = string
  description = "Nama project yang digunakan di GCP"
}

variable "gcp_region" {
  type = string
  description = "Region project yang digunakan di GCP"
}

variable "gcp_zone" {
  type = string
  description = "Zona project yang digunakan di GCP"
}

variable gcp_machine_micro {
  type = string
  description = "Pemanggilan tipe VM micro dengan 0.25-2 CPU dan 1 GB Memory"
}

variable gcp_machine_small {
  type = string
  description = "Pemanggilan tipe VM small dengan 0.5-2 CPU dan 2 GB Memory"
}

variable gcp_machine_medium {
  type = string
  description = "Pemanggilan tipe VM medium dengan 1-2 CPU dan 4 GB Memory"
}

variable "gcp_disk_image" {
  type = string
  description = "Image disk yang akan digunakan"
  default = "ubuntu-os-cloud/ubuntu-minimal-2404-lts-amd64"
}

variable "gcp_disk_size" {
  type = number
  description = "Size buat disk VM"
  default = 20
}

variable "gcp_disk_type" {
  type = string
  description = "Tipe disk yang kita gunakan"
  default = "pd-balanced"
}

variable "my_ip_address" {
  type = string
  description = "Personal IP address untuk VM yang saya restrict aksesnya"
}

variable "ssh_user" {
  type = string
  description = "Nama user yang akan dibuat di VM untuk Final Project"
}

variable "ssh_pub_key" {
  type = string
  description = "Public Key buat SSH"
}