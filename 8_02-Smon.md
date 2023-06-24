## Домашнее задание к занятию "`Система мониторинга Zabbix`" - `Камаев Евгений`

Создайте виртуальную машину в Yandex Compute Cloud и с помощью Yandex Monitoring создайте дашборд, на котором будет видно загрузку процессора.

***Задание 1***


Установите Zabbix Server с веб-интерфейсом.

Процесс выполнения

1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Установите PostgreSQL. Для установки достаточна та версия что есть в системном репозитороии Debian 11

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_02-Smon/9_02_1_2.jpg)

</details>

3. Пользуясь конфигуратором комманд с официального сайта, составьте набор команд для установки последней версии Zabbix с поддержкой PostgreSQL и Apache

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_02-Smon/9_02_1_3.jpg)

</details>

4. Выполните все необходимые команды для установки Zabbix Server и Zabbix Web Server

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_02-Smon/9_02_1_4.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_02-Smon/9_02_1_4_.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_02-Smon/9_02_1_4__.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_02-Smon/9_02_1_4__1.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_02-Smon/9_02_1_4__1_.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_02-Smon/9_02_1_4__1__.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_02-Smon/9_02_1_4__1___.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_02-Smon/9_02_1_4_rezault.jpg)

</details>

---

***Задание 2***

Установите Zabbix Agent на два хоста.

Процесс выполнения

1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Установите Zabbix Agent на 2 виртмашины, одной из них может быть ваш Zabbix Server

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_02-Smon/9_02_2_2.jpg)

</details>

3. Добавьте Zabbix Server в список разрешенных серверов ваших Zabbix Agentов
4. Добавьте Zabbix Agentов в раздел Configuration > Hosts вашего Zabbix Servera
5. Проверьте что в разделе Latest Data начали появляться данные с добавленных агентов

С помощью Yandex Monitoring сделайте 2 алерта на загрузку процессора: WARN и ALARM. Создайте уведомление по e-mail.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_02.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_02_1.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_02_1_.jpg)


</details>


**END**
