#bastion

resource "yandex_compute_instance" "bastion" {
  name        = "vm-bastion"
  hostname    = "bastion"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p2l9n9t6tc9irm3tl"
      size     = 10
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.in-subnet.id
    security_group_ids = [yandex_vpc_default_security_group.sg-bastion.id]
    nat                = true
    ip_address         = "10.1.10.254"
  }

  depends_on = [yandex_vpc_default_security_group.sg-bastion]

  metadata = {
    user-data = "${file("./meta.txt")}"
  }
}
