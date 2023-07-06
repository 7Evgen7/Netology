## Домашнее задание к занятию "`Система мониторинга Prometheus`" - `Камаев Евгений`

Создайте виртуальную машину в Yandex Compute Cloud и с помощью Yandex Monitoring создайте дашборд, на котором будет видно загрузку процессора.

***Задание 1***

Установите Prometheus.

Процесс выполнения
1. Выполняя задание, сверяйтесь с процессом, отражённым в записи лекции
2. Создайте пользователя prometheus

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_1_2.jpg)

</details>

3. Скачайте prometheus и в соответствии с лекцией разместите файлы в целевые директории

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_1_3.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_1_3_.jpg)

</details>

4. Создайте сервис как показано на уроке

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_1_4.jpg)

</details>

5. Проверьте что prometheus запускается, останавливается, перезапускается и отображает статус с помощью systemctl

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_1_5.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_1_5_.jpg)

</details>

Требования к результату
* Прикрепите к файлу README.md скриншот systemctl status prometheus, где будет написано: prometheus.service — Prometheus Service Netology Lesson 9.4 — [Ваши ФИО]

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_1_5__.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_1_5___.jpg)

</details>

---

***Задание 2***

Установите Node Exporter.

Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Скачайте node exporter приведённый в презентации и в соответствии с лекцией разместите файлы в целевые директории

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_2_2.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_2_2_.jpg)

</details>

3. Создайте сервис для как показано на уроке

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_2_3.jpg)

</details>

4. Проверьте что node exporter запускается, останавливается, перезапускается и отображает статус с помощью systemctl

Требования к результату
* Прикрепите к файлу README.md скриншот systemctl status node-exporter, где будет написано: node-exporter.service — Node Exporter Netology Lesson 9.4 — [Ваши ФИО]

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_2_4.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_2_4_.jpg)

</details>

 ---

 ***Задание 3***

Подключите Node Exporter к серверу Prometheus.

Процесс выполнения
1. Выполняя ДЗ сверяйтесь с процессом отражённым в записи лекции.
2. Отредактируйте prometheus.yaml, добавив в массив таргетов установленный в задании 2 node exporter

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_3_2.jpg)

</details>

3. Перезапустите prometheus

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_3_3.jpg)

</details>

4. Проверьте что он запустился

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_3_4.jpg)

</details>

Требования к результату
* Прикрепите к файлу README.md скриншот конфигурации из интерфейса Prometheus вкладки Status > Configuration
* Прикрепите к файлу README.md скриншот из интерфейса Prometheus вкладки Status > Targets, чтобы было видно минимум два эндпоинта

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_3_4_.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_04-Smon/9_04_3_4__.jpg)

</details>

**END**
