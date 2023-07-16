## Домашнее задание к занятию "`Disaster recovery и Keepalived`" - `Камаев Евгений`

***Задание 1***

Создайте файл с правилом оповещения, как в лекции, и добавьте его в конфиг Prometheus.

Требования к результату
* Погасите node exporter, стоящий на мониторинге, и прикрепите скриншот раздела оповещений Prometheus, где оповещение будет в статусе Pending

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
