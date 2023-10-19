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

* Установите поддержку LUKS.
* Создайте небольшой раздел, например, 100 Мб.
* Зашифруйте созданный раздел с помощью LUKS.
В качестве ответа пришлите снимки экрана с поэтапным выполнением задания.

`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/13_02_SYSSEC/13_2_2.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/13_02_SYSSEC/13_2_2_.jpg)

   
</details>
