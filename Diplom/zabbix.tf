resource "yandex_compute_instance" "zabbix" {
  name        = "vm-zabbix"
  hostname    = "zabbix-server"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  resources {
    cores  = 2
    memory = 8
    core_fraction = 20 
  }
 
  boot_disk {
    initialize_params {
      image_id = "fd8p2l9n9t6tc9irm3tl"
      size     = 10
    }
  }

  network_interface {
    subnet_id          = yandex_vpc_subnet.subnet-nginx1.id
    security_group_ids = [yandex_vpc_security_group.in-sg.id, yandex_vpc_security_group.sg-zabbix.id]    
    nat                = true
    ip_address         = "10.1.11.254"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  } 
}

