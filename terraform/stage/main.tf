terraform {
  required_providers {
    yandex = {
      source  = "yandex-cloud/yandex"
      version = "= 0.96.1"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "db" {
  source          = "../modules/db"
  public_key_path = var.public_key_path
  db_disk_image   = var.db_disk_image
  subnet_id       = var.subnet_id
  stage           = var.stage
  connection_key_file = var.connection_key_file
}

module "app" {
  source          = "../modules/app"
  public_key_path = var.public_key_path
  network_id      = var.network_id
  app_disk_image  = var.app_disk_image
  subnet_id       = var.subnet_id
  stage           = var.stage
  connection_key_file = var.connection_key_file
  DB_IP           = module.db.internal_ip_address_db
  depends_on      = [
    module.db
  ]
}
