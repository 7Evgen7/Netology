## Домашнее задание к занятию "`Защита сети`" - `Камаев Евгений`

Подготовка к выполнению заданий
Подготовка защищаемой системы:
* установите Suricata,
* установите Fail2Ban.
Подготовка системы злоумышленника: установите nmap и thc-hydra либо скачайте и установите Kali linux.
Обе системы должны находится в одной подсети.

`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/13_03_SYSSEC/13_3_.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/13_03_SYSSEC/13_3__.jpg)
   
</details>

***Задание 1***

Проведите разведку системы и определите, какие сетевые службы запущены на защищаемой системе:

sudo nmap -sA < ip-адрес >

sudo nmap -sT < ip-адрес >

sudo nmap -sS < ip-адрес >

sudo nmap -sV < ip-адрес >


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/13_03_SYSSEC/13_3_1_1.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/13_03_SYSSEC/13_3_1_2.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/13_03_SYSSEC/13_3_1_3.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/13_03_SYSSEC/13_3_1_4.jpg)
   
</details>


---

***Задание 2***

Проведите атаку на подбор пароля для службы SSH:

hydra -L users.txt -P pass.txt < ip-адрес > ssh

1. Настройка hydra:
* создайте два файла: users.txt и pass.txt;
* в каждой строчке первого файла должны быть имена пользователей, второго — пароли. В нашем случае это 
могут быть случайные строки, но ради эксперимента можете добавить имя и пароль существующего пользователя.

`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/13_03_SYSSEC/13_3_2_1.jpg)
   
</details>

2. Включение защиты SSH для Fail2Ban:
* открыть файл /etc/fail2ban/jail.conf,
* найти секцию ssh,
* установить enabled в true.

`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/13_03_SYSSEC/13_3_2_2.jpg)

   
</details>


***КОНЕЦ***
