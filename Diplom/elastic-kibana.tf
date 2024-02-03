resource "yandex_compute_instance" "elastic" {
  name        = "vm-elastic"
  hostname    = "elastic1"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"

  resources {
    cores         = 2
    memory        = 8
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p2l9n9t6tc9irm3tl"
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-nginx1.id
    security_group_ids = [yandex_vpc_security_group.in-sg.id, yandex_vpc_security_group.sg-elastic.id]    
    ip_address = "10.1.11.11"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  } 
}

resource "yandex_compute_instance" "kibana" {
  name        = "vm-kibana"
  hostname    = "kibana1"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"
  
  resources {
    cores         = 2
    memory        = 8
    core_fraction = 20
  }

  boot_disk {
    initialize_params {
      image_id = "fd8p2l9n9t6tc9irm3tl"
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-nginx1.id
    security_group_ids = [yandex_vpc_security_group.in-sg.id,yandex_vpc_security_group.sg-kibana.id]    
    nat       = true
    ip_address = "10.1.11.22"
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  } 
}
