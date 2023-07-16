## Домашнее задание к занятию "`Disaster recovery и Keepalived`" - `Камаев Евгений`

***Задание 1***

* Дана схема для Cisco Packet Tracer, рассматриваемая в лекции.
* На данной схеме уже настроено отслеживание интерфейсов маршрутизаторов Gi0/1 (для нулевой группы)
* Необходимо аналогично настроить отслеживание состояния интерфейсов Gi0/0 (для первой группы).

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_01/10_1_1_1_.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_01/10_1_1_1__.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_01/10_1_1_1.jpg)

</details>

* Для проверки корректности настройки, разорвите один из кабелей между одним из маршрутизаторов и Switch0 и запустите ping между PC0 и Server0.
* На проверку отправьте получившуюся схему в формате pkt и скриншот, где виден процесс настройки маршрутизатора.


<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_05-Smon/9_05_1.jpg)

</details>

---

***Задание 2***


Bash-скрипт, который будет проверять доступность порта данного веб-сервера и существование файла index.html
```
#!/bin/bash

if [[ $(netstat -tulpn | grep LISTEN | grep :80) ]] && [[ -f /var/www/html/index.nginx-debian.html ]]; then
exit 0
else
exit 1
fi
```

keepalived.conf
```
global_defs {
    script_user root
    enable_script_security
}

vrrp_script testing_server {
    script "/etc/keepalived/tserver.sh"
    interval 3
}

vrrp_instance VI_1 {
        state MASTER
        interface enp0s3
        virtual_router_id 15
        priority 255
        advert_int 1

        virtual_ipaddress {
                192.168.50.15/24
        }

        track_script {
           testing_server
        }
}
```
