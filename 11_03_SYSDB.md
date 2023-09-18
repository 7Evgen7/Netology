## Домашнее задание к занятию "`ELK`" - `Камаев Евгений`

***Задание 1. Elasticsearch***

Установите и запустите Elasticsearch, после чего поменяйте параметр cluster_name на случайный.

Приведите скриншот команды 'curl -X GET 'localhost:9200/_cluster/health?pretty', сделанной на сервере с установленным Elasticsearch. Где будет виден нестандартный cluster_name.

`Решение`

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_03_SYSDB/11_03_.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_03_SYSDB/11_03.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_03_SYSDB/11_03_1.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_03_SYSDB/11_03_1_.jpg)
   
</details>



---

***Задание 2. Kibana***

Установите и запустите Kibana.

Приведите скриншот интерфейса Kibana на странице http://<ip вашего сервера>:5601/app/dev_tools#/console, где будет выполнен запрос GET /_cluster/health?pretty.


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_03_SYSDB/11_03_2.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_03_SYSDB/11_03_2_.jpg)
   
</details>


---

***Задание 3. Logstash***

Установите и запустите Logstash и Nginx. С помощью Logstash отправьте access-лог Nginx в Elasticsearch.

Приведите скриншот интерфейса Kibana, на котором видны логи Nginx.


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_03_SYSDB/11_03_3.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_03_SYSDB/11_03_3_.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_03_SYSDB/11_03_3__.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_03_SYSDB/11_03_3__1.jpg)
   
</details>


---

***Задание 4. Filebeat***

Установите и запустите Filebeat. Переключите поставку логов Nginx с Logstash на Filebeat.

Приведите скриншот интерфейса Kibana, на котором видны логи Nginx, которые были отправлены через Filebeat.


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_02_SYSDB/11_2_2_.jpg)
   
</details>

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_02_SYSDB/11_2_2_.jpg)
   
</details>

***КОНЕЦ***
