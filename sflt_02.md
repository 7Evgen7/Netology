## Домашнее задание к занятию "`Кластеризация и балансировка нагрузки`" - `Камаев Евгений`

***Задание 1***

* Запустите два simple python сервера на своей виртуальной машине на разных портах

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_02/10_2_1.jpg)

</details>

* Установите и настройте HAProxy, воспользуйтесь материалами к лекции по ссылке
* Настройте балансировку Round-robin на 4 уровне.
* На проверку направьте конфигурационный файл haproxy, скриншоты, где видно перенаправление запросов на разные серверы при обращении к HAProxy.

<details>

![конфигурационный файл haproxy](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_02/haproxy.cfg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_02/10_2_1_.jpg)

</details>


---

***Задание 2***

* Запустите три simple python сервера на своей виртуальной машине на разных портах
* Настройте балансировку Weighted Round Robin на 7 уровне, чтобы первый сервер имел вес 2, второй - 3, а третий - 4
* HAproxy должен балансировать только тот http-трафик, который адресован домену example.local
* На проверку направьте конфигурационный файл haproxy, скриншоты, где видно перенаправление запросов на разные серверы при обращении к HAProxy c использованием домена example.local и без него.

<details>

![конфигурационный файл haproxy](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_02/haproxy_.cfg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_02/10_2_2_4.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/SFLT_02/10_2_2_4_.jpg)

</details>



**КОНЕЦ**
