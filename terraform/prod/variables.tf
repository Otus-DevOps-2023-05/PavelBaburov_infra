variable "cloud_id" {
  description = "Cloud"
}
variable "folder_id" {
  description = "Folder"
}
variable "zone" {
  description = "Zone"
  # Значение по умолчанию
  default = "ru-central1-a"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
# variable "image_id" {
#   description = "Disk image"
# }

variable "network_id" {
  description = "Network identifier"
}

variable "subnet_id" {
  description = "Subnet"
}
variable "service_account_key_file" {
  description = "key.json"
}
variable "connection_key_file" {
  description = "ssh private key"
}
variable "vm_count" {
  description = "vm count"
}
variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-only"
}
variable "db_disk_image" {
  description = "Disk image for reddit db"
  default     = "mongo-db"
}
variable "stage" {
  description = "stage"
}
