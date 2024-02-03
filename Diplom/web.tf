data "yandex_compute_image" "lemp" {
  family = "lemp"
}

resource "yandex_compute_instance" "nginx1" {
  name        = "vm-webserver1"
  hostname    = "webserver1"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.lemp.id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-nginx1.id
    security_group_ids = [yandex_vpc_security_group.in-sg.id, yandex_vpc_security_group.sg-zabbix.id]
	ip_address = "10.1.11.10"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}

resource "yandex_compute_instance" "nginx2" {
  name        = "vm-webserver2"
  hostname    = "webserver2"
  platform_id = "standard-v3"
  zone        = "ru-central1-b"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.lemp.id
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-nginx2.id
    security_group_ids = [yandex_vpc_security_group.in-sg.id, yandex_vpc_security_group.sg-zabbix.id]
	ip_address = "10.1.12.10"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  } 
}
