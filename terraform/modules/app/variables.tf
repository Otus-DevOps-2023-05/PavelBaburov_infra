variable app_disk_image {
  description = "Disk image for reddit app"
  default = "reddit-only"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}

variable "network_id" {
  description = "Network identifier"
}

variable "subnet_id" {
  description = "Subnet"
}
variable "stage" {
  description = "stage"
  default = "stage"
}

variable "connection_key_file" {
  description = "ssh private key"
}

variable "DB_IP" {
  description = "IP of mongo db"
  default = "127.0.0.1"
}
