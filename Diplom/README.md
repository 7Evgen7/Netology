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

* ВМ с версией linux Ubuntu 18.04

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
    security_group_ids = [yandex_vpc_security_group.in-sg.id, yandex_vpc_securi$
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
