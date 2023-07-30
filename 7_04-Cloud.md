## Домашнее задание к занятию "`Подъём инфраструктуры в Yandex Cloud`" - `Камаев Евгений`


***Задание 1***

Выполните действия, приложите скриншот скриптов, скриншот выполненного проекта.

От заказчика получено задание: при помощи Terraform и Ansible собрать виртуальную инфраструктуру и развернуть на ней веб-ресурс.

В инфраструктуре нужна одна машина с ПО ОС Linux, двумя ядрами и двумя гигабайтами оперативной памяти.

Требуется установить nginx, залить при помощи Ansible конфигурационные файлы nginx и веб-ресурса.

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_04-Cloud/7_04_1.jpg)

   
</details>

Файл terraform main.tf
```
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

variable "yandex_cloud_token" {
  type = string
  description = "Введите секретный токен от yandex_cloud"
}

provider "yandex" {
  token     = var.yandex_cloud_token
  cloud_id  = "b1gbm.........msv1ak"
  folder_id = "b1g2o.........aisetm"
  zone      = "ru-central1-a"
}
resource "yandex_compute_instance" "vm-1" {
  name        = "debian1"
  platform_id = "standard-v2"

  scheduling_policy {
    preemptible = true
  }

  resources {
    core_fraction = 5
    cores         = 2
    memory        = 2
  }

  boot_disk {
    initialize_params {
      image_id = "fd81mpc969gbg44vndkv"
      size     = 10
    }
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    user-data = "${file("./meta.txt")}"
  }

}
resource "yandex_vpc_network" "network-1" {
  name = "network1"
}
resource "yandex_vpc_subnet" "subnet-1" {
  name           = "subnet1"
  zone           = "ru-central1-a"
  network_id     = yandex_vpc_network.network-1.id
  v4_cidr_blocks = ["192.168.10.0/24"]
}
output "internal_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.ip_address
}
output "external_ip_address_vm_1" {
  value = yandex_compute_instance.vm-1.network_interface.0.nat_ip_address
}
```

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_04-Cloud/7_04_2.jpg)
   
</details>

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_04-Cloud/7_04_3.jpg)
   
</details>

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_04-Cloud/7_04_4.jpg)
   
</details>

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_04-Cloud/7_04_5.jpg)
   
</details>

Содержимое файла ansible main.yml

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_04-Cloud/7_04_5_.jpg)
   
</details>

Установка и проверка nginx.

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_04-Cloud/7_04_6.jpg)
   
</details>

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_04-Cloud/7_04_7.jpg)
   
</details>

**КОНЕЦ**
