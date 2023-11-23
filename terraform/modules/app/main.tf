terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
      version = "= 0.96.1"
    }
  }
  required_version = ">= 0.13"
}

resource "yandex_vpc_security_group" "reddit-app" {
  description = "Default security group for reddit-app instances"
  name        = "sg-reddit"
  network_id  = var.network_id

  ingress {
    description    = "Allow connections to the Prometheus"
    protocol       = "TCP"
    port           = 80
    v4_cidr_blocks = ["0.0.0.0/0"]
  }

}

resource "yandex_compute_instance" "app" {
  name = "${var.stage}-reddit-app"

  labels = {
    tags = "reddit-app"
  }
  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
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

#  provisioner "file" {
#    content     = templatefile("${path.module}/files/puma.service", { DB_IP = var.DB_IP })
#    destination = "/tmp/puma.service"
#  }

#  provisioner "remote-exec" {
#    script = "${path.module}/files/deploy.sh"
#  }
}
