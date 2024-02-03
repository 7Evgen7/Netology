##  Дипломная работа по профессии «Системный администратор»
---
##  Камаев Евгений
---

Содержание
----------
* [Задача](#Задача)
* [Инфраструктура](#Инфраструктура)
    * [Сайт](#Сайт)
    * [Мониторинг](#Мониторинг)
    * [Логи](#Логи)
    * [Сеть](#Сеть)
    * [Резервное копирование](#Резервное-копирование)
    * [Дополнительно](#Дополнительно)
* [Выполнение работы](#Выполнение-работы)
* [Критерии сдачи](#Критерии-сдачи)
* [Как правильно задавать вопросы дипломному руководителю](#Как-правильно-задавать-вопросы-дипломному-руководителю) 

---------

## Задача
Ключевая задача — разработать отказоустойчивую инфраструктуру для сайта, включающую мониторинг, сбор логов и резервное копирование основных данных. Инфраструктура должна размещаться в [Yandex Cloud](https://cloud.yandex.com/) и отвечать минимальным стандартам безопасности: запрещается выкладывать токен от облака в git. Используйте [инструкцию](https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart#get-credentials).

**Перед началом работы над дипломным заданием изучите [Инструкция по экономии облачных ресурсов](https://github.com/netology-code/devops-materials/blob/master/cloudwork.MD).**

## Инфраструктура
Для развёртки инфраструктуры используйте Terraform и Ansible.  

Не используйте для ansible inventory ip-адреса! Вместо этого используйте fqdn имена виртуальных машин в зоне ".ru-central1.internal". Пример: example.ru-central1.internal  

Важно: используйте по-возможности **минимальные конфигурации ВМ**:2 ядра 20% Intel ice lake, 2-4Гб памяти, 10hdd, прерываемая. 

**Так как прерываемая ВМ проработает не больше 24ч, перед сдачей работы на проверку дипломному руководителю сделайте ваши ВМ постоянно работающими.**

Ознакомьтесь со всеми пунктами из этой секции, не беритесь сразу выполнять задание, не дочитав до конца. Пункты взаимосвязаны и могут влиять друг на друга.

### Сайт
Создайте две ВМ в разных зонах, установите на них сервер nginx, если его там нет. ОС и содержимое ВМ должно быть идентичным, это будут наши веб-сервера.

Используйте набор статичных файлов для сайта. Можно переиспользовать сайт из домашнего задания.

Создайте [Target Group](https://cloud.yandex.com/docs/application-load-balancer/concepts/target-group), включите в неё две созданных ВМ.

Создайте [Backend Group](https://cloud.yandex.com/docs/application-load-balancer/concepts/backend-group), настройте backends на target group, ранее созданную. Настройте healthcheck на корень (/) и порт 80, протокол HTTP.

Создайте [HTTP router](https://cloud.yandex.com/docs/application-load-balancer/concepts/http-router). Путь укажите — /, backend group — созданную ранее.

Создайте [Application load balancer](https://cloud.yandex.com/en/docs/application-load-balancer/) для распределения трафика на веб-сервера, созданные ранее. Укажите HTTP router, созданный ранее, задайте listener тип auto, порт 80.

Протестируйте сайт
`curl -v <публичный IP балансера>:80` 

### Мониторинг
Создайте ВМ, разверните на ней Zabbix. На каждую ВМ установите Zabbix Agent, настройте агенты на отправление метрик в Zabbix. 

Настройте дешборды с отображением метрик, минимальный набор — по принципу USE (Utilization, Saturation, Errors) для CPU, RAM, диски, сеть, http запросов к веб-серверам. Добавьте необходимые tresholds на соответствующие графики.

### Логи
Cоздайте ВМ, разверните на ней Elasticsearch. Установите filebeat в ВМ к веб-серверам, настройте на отправку access.log, error.log nginx в Elasticsearch.

Создайте ВМ, разверните на ней Kibana, сконфигурируйте соединение с Elasticsearch.

### Сеть
Разверните один VPC. Сервера web, Elasticsearch поместите в приватные подсети. Сервера Zabbix, Kibana, application load balancer определите в публичную подсеть.

Настройте [Security Groups](https://cloud.yandex.com/docs/vpc/concepts/security-groups) соответствующих сервисов на входящий трафик только к нужным портам.

Настройте ВМ с публичным адресом, в которой будет открыт только один порт — ssh.  Эта вм будет реализовывать концепцию  [bastion host]( https://cloud.yandex.ru/docs/tutorials/routing/bastion) . Синоним "bastion host" - "Jump host". Подключение  ansible к серверам web и Elasticsearch через данный bastion host можно сделать с помощью  [ProxyCommand](https://docs.ansible.com/ansible/latest/network/user_guide/network_debug_troubleshooting.html#network-delegate-to-vs-proxycommand) . Допускается установка и запуск ansible непосредственно на bastion host.(Этот вариант легче в настройке)

### Резервное копирование
Создайте snapshot дисков всех ВМ. Ограничьте время жизни snaphot в неделю. Сами snaphot настройте на ежедневное копирование.

## Выполнение работы
На этом этапе вы непосредственно выполняете работу. При этом вы можете консультироваться с руководителем по поводу вопросов, требующих уточнения.

⚠️ В случае недоступности ресурсов Elastic для скачивания рекомендуется разворачивать сервисы с помощью docker контейнеров, основанных на официальных образах.

**Важно**: Ещё можно задавать вопросы по поводу того, как реализовать ту или иную функциональность. И руководитель определяет, правильно вы её реализовали или нет. Любые вопросы, которые не освещены в этом документе, стоит уточнять у руководителя. Если его требования и указания расходятся с указанными в этом документе, то приоритетны требования и указания руководителя.

---

`Решение поставленных задач по дипломному проекту`

К дипломной работе установлены:

* ВМ с версией linux Ubuntu 20.04

* установлены Terrafom и Ansible следующих версий:

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/ter_ans_version.jpg)
   
</details>

Для поднятия ВМ с помощью Terraform в Yandex Cloud делаем необходимые настройки:
* в `provider.tf` прописываем:
```
terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
  required_version = ">= 0.95"
}

provider "yandex" {
  token     = "`s`ff`e`hff`c`hf`k`gh`r`hhfg`e`hghg`t`"
  cloud_id  = "`s`ff`e`hff`c`hf`k`gh`r`hhfg`e`hghg`t`"
  folder_id = "`s`ff`e`hff`c`hf`k`gh`r`hhfg`e`hghg`t`"
}
```
* в `meta.txt` прописываем:
```
#cloud-config

users:
  - name: kamaev
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
      - ssh-rsa `s`ff`e`hff`c`hf`k`gh`r`hhfg`e`hghg`t` kamaev@bastion
```
* для создания `bastion`
```
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
      image_id = "fd83at8vqe2ajlj581ir"
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
  scheduling_policy {
    preemptible = true
  }
}
```
* для создания 2-х одинаковых ВМ в разных зонах использую стек LEMP (уже есть nginx и mySQL)

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/lemp.jpg)
   
</details>

```
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
  scheduling_policy {
    preemptible = true
  }
]
```
Вторая ВМ прописывается аналогично, только в другой `zone`.

* создаем файлы с описанием `network`, `subnet`, `security group`, `target group`, `backend group`, `http router` и `balancer`

```
resource "yandex_vpc_network" "net" {
  name = "network1"
}
resource "yandex_vpc_subnet" "in-subnet" {
  name           = "subnet-bastion"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.net.id}"
  v4_cidr_blocks = ["10.1.10.0/24"]
}
resource "yandex_vpc_subnet" "subnet-nginx1" {
  name           = "subnet-nginx1"
  zone           = "ru-central1-a"
  network_id     = "${yandex_vpc_network.net.id}"
  v4_cidr_blocks = ["10.1.11.0/24"]
  depends_on = [yandex_vpc_network.net]
}
resource "yandex_vpc_subnet" "subnet-nginx2" {
  name           = "subnet-nginx2"
  zone           = "ru-central1-b"
  network_id     = "${yandex_vpc_network.net.id}"
  v4_cidr_blocks = ["10.1.12.0/24"]
  depends_on = [yandex_vpc_network.net]
}
###security_group####
resource "yandex_vpc_default_security_group" "sg-bastion" {
  network_id  = "${yandex_vpc_network.net.id}"
  ingress {
    protocol       = "TCP"
    description    = "allow ssh"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 22
  }

  ingress {
    protocol       = "TCP"
    description    = "proxy"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24"]
    port           = 3128
  }
  egress {
    protocol       = "ANY"
    description    = "allow ping"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}
resource "yandex_vpc_security_group" "in-sg" {
  name        = "in-sg"
  network_id  = "${yandex_vpc_network.net.id}"
 ingress {
    protocol       = "TCP"
    description    = "allow ssh"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24"]
    port           = 22
  }
 ingress {
    protocol       = "TCP"
    description    = "http"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 80
  }
  ingress {
    protocol       = "TCP"
    description    = "https"
    v4_cidr_blocks = ["0.0.0.0/0"]
    port           = 443
  }
   egress {
    protocol       = "ANY"
    description    = "ANY"
    v4_cidr_blocks= ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }

  egress {
    protocol       = "TCP"
    description    = "proxy"
    v4_cidr_blocks = ["10.1.10.254/32"]
    port           = 3128
  }
}
resource "yandex_vpc_security_group" "sg-balancer" {
  name        = "sg-balancer"
  network_id  = "${yandex_vpc_network.net.id}"
  ingress {
    protocol       = "ANY"
    description    = "balancer"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
  egress {
    protocol       = "ANY"
    v4_cidr_blocks = ["0.0.0.0/0"]
    from_port      = 0
    to_port        = 65535
  }
}
resource "yandex_vpc_security_group" "sg-elastic" {
  name        = "sg-elastic"
  network_id  = "${yandex_vpc_network.net.id}"
  ingress {
    protocol       = "TCP"
    description    = "elastic"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24" ]
    port           = 9200
  }
   egress {
   protocol        = "TCP"
    description    = "elastic"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24"]
    port           = 5601
  }
}
resource "yandex_vpc_security_group" "sg-kibana" {
  name        = "sg-kibana"
  network_id  = "${yandex_vpc_network.net.id}"
  ingress {
    protocol       = "TCP"
    description    = "kibana"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24" ]
    port           = 5601
  }
   egress {
    protocol = "TCP"
    description    = "kibana"
    v4_cidr_blocks= ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24"]
    port           = 9201
  }
}
resource "yandex_vpc_security_group" "sg-zabbix" {
  name        = "zabbix"
  network_id  = "${yandex_vpc_network.net.id}"
  ingress {
    protocol       = "TCP"
    description    = "zabbix"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24" ]
    port           = 10050
  }
   egress {
    protocol       = "TCP"
    description    = "zabbix"
    v4_cidr_blocks = ["10.1.10.0/24","10.1.11.0/24","10.1.12.0/24"]
    port           = 10050
  }
}

```

```
#target_group
resource "yandex_alb_target_group" "targetg" {
  name = "group1"
  target {
    subnet_id    = "${yandex_vpc_subnet.subnet-nginx1.id}"
    ip_address   = "${yandex_compute_instance.nginx1.network_interface.0.ip_address}"
  }
  target {
    subnet_id    = "${yandex_vpc_subnet.subnet-nginx2.id}"
    ip_address   = "${yandex_compute_instance.nginx2.network_interface.0.ip_address}"
  }
}
#backend_group
resource "yandex_alb_backend_group" "backend-group" {
  name = "backend-group1"
  http_backend {
    name             = "http-backend"
    weight           = 1
    port             = 80
    target_group_ids = ["${yandex_alb_target_group.targetg.id}"]

    healthcheck {
      timeout             = "1s"
      interval            = "1s"
      http_healthcheck {
        path              = "/"
      }
    }
  }
}
#HTTP router
resource "yandex_alb_http_router" "router" {
  name          = "http-router1"
  labels        = {
    tf-label    = "router-value"
    empty-label = ""
  }
}
resource "yandex_alb_virtual_host" "vh" {
  name           = "virtual-host"
  http_router_id = yandex_alb_http_router.router.id
  route {
    name = "route1"
    http_route {
      http_route_action {
        backend_group_id = yandex_alb_backend_group.backend-group.id
        timeout          = "3s"
      }
    }
  }
}
#Balancer
resource "yandex_alb_load_balancer" "lb" {
  name               = "load-balancer"
  network_id         = yandex_vpc_network.net.id
  security_group_ids = [yandex_vpc_security_group.sg-balancer.id]
  allocation_policy {
    location {
      zone_id   = "ru-central1-a"
      subnet_id = yandex_vpc_subnet.subnet-nginx1.id
    }
    location {
      zone_id   = "ru-central1-b"
      subnet_id = yandex_vpc_subnet.subnet-nginx2.id
    }
  }
  listener {
    name = "listener1"
    endpoint {
      address {
        external_ipv4_address {
        }
      }
      ports = [80]
    }
    http {
      handler {
        http_router_id = yandex_alb_http_router.router.id
      }
    }
  }
}

```

* для создания ВМ для `elastic` и `kibana`:
```
resource "yandex_compute_instance" "elastic" {
  name        = "vm-elastic"
  hostname    = "elastic1"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"
  resources {
    cores         = 2
    memory        = 6
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = "fd83at8vqe2ajlj581ir"
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
  scheduling_policy {
    preemptible = true
  }
resource "yandex_compute_instance" "kibana" {
  name        = "vm-kibana"
  hostname    = "kibana1"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"
  resources {
    cores         = 2
    memory        = 6
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = "fd83at8vqe2ajlj581ir"
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
  scheduling_policy {
    preemptible = true
  }
}
```
* для создания ВМ для `zabbix`
```
resource "yandex_compute_instance" "zabbix" {
  name        = "vm-zabbix"
  hostname    = "zabbix-server"
  platform_id = "standard-v3"
  zone        = "ru-central1-a"
  resources {
    cores  = 2
    memory = 2
    core_fraction = 20
  }
  boot_disk {
    initialize_params {
      image_id = "fd83at8vqe2ajlj581ir"
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
  scheduling_policy {
    preemptible = true
  }

```

* прописываем создание `snapshot`:

```
resource "yandex_compute_snapshot_schedule" "snapshot" {
  name = "snapshots"
  schedule_policy {
        expression = "0 21 ? * *"
  }
  retention_period = "168h"
  snapshot_spec {
          description = "retention-snapshot"
  }
  disk_ids = ["${yandex_compute_instance.bastion.boot_disk[0].disk_id}",
              "${yandex_compute_instance.nginx1.boot_disk[0].disk_id}",
              "${yandex_compute_instance.nginx2.boot_disk[0].disk_id}",
              "${yandex_compute_instance.zabbix.boot_disk[0].disk_id}",
              "${yandex_compute_instance.elastic.boot_disk[0].disk_id}",
              "${yandex_compute_instance.kibana.boot_disk[0].disk_id}"]
}

```

* в данный момент у нас следующее дерево файлов:
```
kamaev@ubuntu-diplom:~/project$ tree
.
└── terraform
    ├── bastion.tf
    ├── elastic-kibana.tf
    ├── hosts.tf
    ├── meta.txt
    ├── network.tf
    ├── outputs.tf
    ├── provider.tf
    ├── snapshots.tf
    ├── target-group.tf
    ├── web.tf
    └── zabbix.tf
```

* готовимся к запуску Terraform, `terraform init`, а также `validate`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/terraform_init.jpg)

</details>

* `terraform plan`

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/terraform_plan.jpg)

</details>

* `terraform apply`

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/terraform_apply_.jpg)
   
</details>

* вот поднятые ВМ

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/vm_.jpg)
   
</details>

* тестируем сайт `curl -v <публичный IP балансера>:80`
<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/curl_.jpg)
   
</details>

* делаем тест работоспособности сайта, отключаем обе ВМ с nginx:

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/curl_no.jpg)
   
</details>

* затем включим одну ВМ с nginx и сайт опять поднимется:

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/curl_no1.jpg)
   
</details>

* после всех действий у нас следующее дерево файлов:

```
kamaev@ubuntu-diplom:~/project$ tree
.
└── terraform
    ├── ansible
    │   ├── ansible.log
    │   └── inventory.ini
    ├── ansible.cfg
    ├── bastion.tf
    ├── elastic-kibana.tf
    ├── elasticsearch.yml
    ├── filebeat.yml
    ├── hosts.tf
    ├── kibana.yml
    ├── meta.txt
    ├── network.tf
    ├── outputs.tf
    ├── provider.tf
    ├── snapshots.tf
    ├── target-group.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    ├── web.tf
    └── zabbix.tf
```
* Для машин, у которых нет публичных адресов скачиваем deb-пакеты (elastic, filebeat и zabbix-agent):

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/copy_elastic.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/copy_filebeat.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/copy_za.jpg)

</details>
  

* создаем все необходимые playbook, для zabbix - zabbix-agentd.conf, также yml для elastic, kibana, filebeat и zabbix-server:

`playbook-elastic`

```
---
- name: Install elasticsearch
  hosts: elastic
  become: yes
  tasks:

  - name: Copy elasticsearch
    copy:
      src: /home/kamaev/project/terraform/elasticsearch-7.17.9-amd64.deb
      dest: /home/kamaev

  - name: Install elasticsearch
    apt:
      deb: /home/kamaev/elasticsearch-7.17.9-amd64.deb

  - name: Systemctl daemon reload
    systemd:
      daemon_reload: true
      name: elasticsearch.service
      state: started

  - name: Copy conf-file
    copy:
      src: /home/kamaev/project/terraform/elasticsearch.yml
      dest: /etc/elasticsearch/elasticsearch.yml
      mode: 0644
      owner: root
      group: elasticsearch

  - name: Restart elasticsearch
    systemd:
      name: elasticsearch.service
      state: restarted
```
`playbook-kibana`

```
---
- name: Install Kibana
  hosts: kibana
  become: yes
  tasks:
      - name: Get Kibana
        get_url:
            url: https://mirror.yandex.ru/mirrors/elastic/7/pool/main/k/kibana/kibana-7.17.9-amd64.deb
            dest: /home/kamaev/

      - name: Install Kibana
        apt:
            deb: /home/kamaev/kibana-7.17.9-amd64.deb

      - name: Systemctl daemon reload
        systemd:
            daemon_reload: true
            name: kibana.service
            state: started

      - name: Copy conf-file
        copy:
            src: /home/kamaev/project/terraform/kibana.yml
            dest: /etc/kibana/kibana.yml
            mode: 0644
            owner: root
            group: kibana

      - name: Restart Kibana
        systemd:
            name: kibana.service
            state: restarted

```
`playbook-zs`

```
---
- name: Install zabbix
  hosts: zabbix-server
  become: yes
  tasks:

  - name: apt update
    apt:
        update_cache: yes

  - name: Download zabbix
    get_url:
        url: https://repo.zabbix.com/zabbix/6.0/debian/pool/main/z/zabbix-release/zabbix-release_6.0-4+debian11_all.deb
        dest: /home/kamaev

  - name: Install postgresql
    apt:
       name: postgresql

  - name: Install zabbix
    apt:
       deb: /home/kamaev/zabbix-release_6.0-4+debian11_all.deb

  - name: apt update
    apt:
       update_cache: yes

  - name: install zabbix
    apt:
       name:
          - zabbix-server-pgsql
          - zabbix-frontend-php
          - php7.4-pgsql
          - zabbix-apache-conf
          - zabbix-sql-scripts

  - name: create user db
    shell: |
        su - postgres -c 'psql --command "CREATE USER zabbix WITH PASSWORD '\'kamaev123\'';"'
        su - postgres -c 'psql --command "CREATE DATABASE zabbix OWNER zabbix;"'
        zcat /usr/share/zabbix-sql-scripts/postgresql/server.sql.gz | sudo -u zabbix psql zabbix

  - name: Edit zabbix
    shell: |
        sed -i 's/# DBPassword=/DBPassword=kamaev123/g' /etc/zabbix/zabbix_server.conf

  - name: Restart all sevices
    shell: |
        systemctl restart zabbix-server apache2
        systemctl enable zabbix-server apache2
```

`playbook-zabbix`

```
---
- name: Install Zabbix-agent
  hosts: webserver
  become: yes
  tasks:
      - name: Copy zabbix-agent
        copy:
            src: "/home/kamaev/project/terraform/zabbix-release_6.0-4+debian11_all.deb"
            dest: /home/kamaev/

      - name: Install repositories zabbix-agent
        apt:
           deb: /home/kamaev/zabbix-release_6.0-4+debian11_all.deb

      - name: apt update
        apt:
           update_cache: yes

      - name: install zabbix-agent
        apt:
           name:
              - zabbix-agent

      - name: zabbix-agent stop
        service:
          name: zabbix-agent.service
          state: stopped

      - name: Copy conf-file
        copy:
            src: /home/kamaev/project/terraform/zabbix_agentd.conf
            dest: /etc/zabbix/zabbix_agentd.conf
            mode: 0644
            owner: root
            group: zabbix


      - name: Restart all sevices
        shell: |
             systemctl restart zabbix-agent
             systemctl enable zabbix-agent
```

* Запускаем каждый playbook

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/playbook_elastic.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/playbook_kibana.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/playbook_filebeat.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/playbook_zabbix_server.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/playbook_zabbix_agent.jpg)

</details>

* На машинах проверяем статусы, установленных сервисов

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/elastic_status.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/kibana_status.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/filebeat_status.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/zs_status.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/zag_status.jpg)

</details>

* Для настройки `zabbix-server` заходим на внешний адрес поднятой машины zabbix-server и делаем необходимые настройки, в результате получаем:

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/zabbix_setup.jpg)

</details>

* Далее заходим на web интерфейс zabbix, для настройки подключений к нашем двум машинам с zabbix-agent. После настройки:

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/zabbix_web.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/web1.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/web2.jpg)

</details>

* Проверяем ответ от `elasticsearch` со всех машин:

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/curl_elastic.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/curl_el1.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/curl_el2.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/curl_el3.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/Diplom/JPG/curl_el4.jpg)

</details>
