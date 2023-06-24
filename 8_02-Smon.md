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

1. В окне браузера откройте облачную платформу Yandex Cloud.

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_1.jpg)
   
</details>


2. Перейдите в раздел "Все сервисы" > "Инфраструктура и сеть" > "Compute Cloud".

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_2.jpg)

</details>

3. Нажмите на синюю кнопку "Создать ВМ" в правом верхнем углу окна браузера.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_3.jpg)

</details>

4. Задайте имя виртуальной машины. Используйте английские буквы и цифры.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_4.jpg)

</details>

5. Выберите операционную систему Debian 11.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_5.jpg)

</details>

6. Установите объём HDD равный 3ГБ.
7. Выберите платформу Intel Ice Lake.
8. Установите количество vCPU равное 2.
9. Установите гарантированную долю vCPU равную 20%.
10. Задайте количество RAM равное 1ГБ.
11. Поставьте галочку "Прерываемая".

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_6_11.jpg)

</details>

12. В разделе "Доступ" выберите сервисный аккаунт с ролью `monitoring.editor.` Если такого аккаунта нету, нажмите на кнопку "Создать новый". Задайте имя аккаунта английскими буквами, напротив надписи "Роли в каталоге" нажмите на знак "плюс". Прокручивая колесо мыши на себя, найдите роль `monitoring.editor` и нажмите на неё левой кнопкой мыши. Теперь вы сможете найти только что созданную роль в выпадающем списке аккаунтов.
13. Задайте логин учётной записи вашей виртуальной машины.
14. Вставьте публичный SHH-ключ в поле SSH-ключ. Если этого ключа у вас нету, создайте его с помощью утилиты `PuTTYgen`.
15. Поставьте галочку "Установить" в пункте "Агент сбора метрик".

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_12_15.jpg)

</details>

16. Нажмите на синюю кнопку `"Создать ВМ"`.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_16.jpg)

</details>

17. Перейдите в раздел "Все сервисы" > "Инфраструктура и сеть" > "Monitoring".

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_17.jpg)

</details>

18. Нажмите на кнопку "Создать дашборд", расположенную в разделе "Возможности сервиса" > "Дашборды".

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_18.jpg)

</details>

19. В открывшемся окне в разделе "Добавить виджет" нажмите на "График".

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_19.jpg)

</details>

20. Пред вам предстанет конструктор запросов, выберите "Запрос А".
21. В параметре service конструктора запросов выберите Compute Cloud.
22. В появившемся параметре name конструктора запросов выберите `cpu_utilization`.
23. Поправьте диапазон времени отрисовки графика нажав на кнопку "Сейчас" в верху экрана, левее кнопок 3m, 1h, 1d, 1w, "Отменить".
24. Нажмите на кнопку "Сохранить" в правом верхнем углу экрана.
25. Задайте имя дашборда, если появится окно ввода имени дашборда.
26. Сделайте скриншот.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_20_26.jpg)

</details>

---

***Задание 2 со звёздочкой***

С помощью Yandex Monitoring сделайте 2 алерта на загрузку процессора: WARN и ALARM. Создайте уведомление по e-mail.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_02.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_02_1.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_02_1_.jpg)


</details>


**END**
