terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "= 0.96.1"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_compute_instance" "db" {
  name = "${var.stage}-reddit-db"
  labels = {
    tags = "reddit-db"
  }

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat = true
  }

  metadata = {
  ssh-keys = "ubuntu:${file(var.public_key_path)}"
  }

  connection {
    type  = "ssh"
    host  = self.network_interface.0.nat_ip_address
    user  = "ubuntu"
    agent = false
    # путь до приватного ключа
    private_key = file(var.connection_key_file)
  }

  provisioner "file" {
    content     = templatefile("${path.module}/files/mongod.conf", { IP = yandex_compute_instance.db.network_interface.0.ip_address })
    destination = "/tmp/mongod.conf"
  }

  provisioner "remote-exec" {
    script = "${path.module}/files/apply_db_config.sh"
  }
}
