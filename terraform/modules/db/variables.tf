variable db_disk_image {
  description = "Disk image for reddit db"
  default = "mongo-db"
}
variable "public_key_path" {
  # Описание переменной
  description = "Path to the public key used for ssh access"
}
variable subnet_id {
description = "Subnets for modules"
}
variable "stage" {
  description = "stage"
  default = "stage"
}
variable "connection_key_file" {
  description = "ssh private key"
}
