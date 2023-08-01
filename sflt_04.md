## Домашнее задание к занятию "`Отказоустойчивость в облаке`" - `Камаев Евгений`

***Задание 1***

Возьмите за основу решение к заданию 1 из занятия «Подъём инфраструктуры в Яндекс Облаке».

1. Теперь вместо одной виртуальной машины сделайте terraform playbook, который:
* создаст 2 идентичные виртуальные машины. Используйте аргумент `count` для создания таких ресурсов;
* создаст `таргет-группу`. Поместите в неё созданные на шаге 1 виртуальные машины;
* создаст `сетевой балансировщик нагрузки`, который слушает на порту 80, отправляет трафик на порт 80 виртуальных машин и http healthcheck на порт 80 виртуальных машин.

Рекомендуем изучить `документацию сетевого балансировщика нагрузки` для того, чтобы было понятно, что вы сделали.

2. Установите на созданные виртуальные машины пакет Nginx любым удобным способом и запустите Nginx веб-сервер на порту 80.

3. Перейдите в веб-консоль Yandex Cloud и убедитесь, что:
* созданный балансировщик находится в статусе Active,
* обе виртуальные машины в целевой группе находятся в состоянии healthy.

4. Сделайте запрос на 80 порт на внешний IP-адрес балансировщика и убедитесь, что вы получаете ответ в виде дефолтной страницы Nginx.

В качестве результата пришлите:

1. Terraform Playbook.

```
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.13"
}

provider "yandex" {
  token     = "y0_AgAAAAAmc0a9AATuwQAAAADkpxvbaXozm5MMQPuiNW4i1J3LSzEs5Z8"
  cloud_id  = "b1gbmmfunajo8hmsv1ak"
  folder_id = "b1g2oala3k7fbcaisetm"
  zone      = "ru-central1-a"
}
resource "yandex_compute_instance" "vm" {
  count       = 2
  name        = "vm${count.index}"
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
  network_id     = "${yandex_vpc_network.network-1.id}"
  v4_cidr_blocks = ["192.168.10.0/24"]
}
resource "yandex_lb_network_load_balancer" "lb-1" {
  name = "lb-1"
  listener {
    name = "my-lb1"
    port = 80
    external_address_spec {
      ip_version = "ipv4"
    }
  }
  attached_target_group {
    target_group_id = yandex_lb_target_group.test-1.id
    healthcheck {
      name = "http"
      http_options {
        port = 80
        path = "/"
      }
    }
  }
}
resource "yandex_lb_target_group" "test-1" {
  name        = "test-1"
  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = yandex_compute_instance.vm[0].network_interface.0.ip_address
  }

  target {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    address   = yandex_compute_instance.vm[1].network_interface.0.ip_address
  }
}
output "internal_ip_address_vm0" {
  value = yandex_compute_instance.vm[0].network_interface.0.ip_address
}
output "external_ip_address_vm0" {
  value = yandex_compute_instance.vm[0].network_interface.0.nat_ip_address
}
output "internal_ip_address_vm1" {
  value = yandex_compute_instance.vm[1].network_interface.0.ip_address
}
output "external_ip_address_vm1" {
  value = yandex_compute_instance.vm[1].network_interface.0.nat_ip_address
```

2. Скриншот статуса балансировщика и целевой группы.

3. Скриншот страницы, которая открылась при запросе IP-адреса балансировщика.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_03/10_3_1.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_03/10_3_1.jpg)

</details>

---

***Задание 2***

Теперь вместо создания виртуальных машин создайте группу виртуальных машин с балансировщиком нагрузки.

Nginx нужно будет поставить тоже автоматизированно. Для этого вам нужно будет подложить файл установки Nginx в user-data-ключ метадаты виртуальной машины.

Пример файла установки Nginx.
Как подставлять файл в метадату виртуальной машины.
Перейдите в веб-консоль Yandex Cloud и убедитесь, что:
созданный балансировщик находится в статусе Active,
обе виртуальные машины в целевой группе находятся в состоянии healthy.
Сделайте запрос на 80 порт на внешний IP-адрес балансировщика и убедитесь, что вы получаете ответ в виде дефолтной страницы Nginx.
В качестве результата пришлите

1. Terraform Playbook.

2. Скриншот статуса балансировщика и целевой группы.

3. Скриншот страницы, которая открылась при запросе IP-адреса балансировщика.
<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_03/10_3_2_1.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_03/10_3_2_2.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_03/10_3_2_3.jpg)

</details>



***КОНЕЦ***
