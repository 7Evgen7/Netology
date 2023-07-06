## Домашнее задание к занятию "`Система мониторинга Prometheus. Часть 2`" - `Камаев Евгений`

***Задание 1***

Создайте файл с правилом оповещения, как в лекции, и добавьте его в конфиг Prometheus.

Требования к результату
* Погасите node exporter, стоящий на мониторинге, и прикрепите скриншот раздела оповещений Prometheus, где оповещение будет в статусе Pending

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_05-Smon/9_05_1.jpg)

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
