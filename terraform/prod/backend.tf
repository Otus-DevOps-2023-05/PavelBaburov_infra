terraform {

  backend "s3" {
    endpoint   = "storage.yandexcloud.net"
    bucket     = "for-otus-training"
    region     = "ru-central1-a"
    key        = "terraform_state/prod/terraform.tfstate"

    skip_region_validation      = true
    skip_credentials_validation = true
  }
}
