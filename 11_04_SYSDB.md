## Домашнее задание к занятию "`Очереди RabbitMQ`" - `Камаев Евгений`

***Задание 1. Установка RabbitMQ***

Используя Vagrant или VirtualBox, создайте виртуальную машину и установите RabbitMQ. Добавьте management plug-in и зайдите в веб-интерфейс.

Итогом выполнения домашнего задания будет приложенный скриншот веб-интерфейса RabbitMQ.

`Решение`

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_04_SYSDB/11_04_1.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_04_SYSDB/11_04_1_.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_04_SYSDB/11_04_1__.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_04_SYSDB/11_04_1___.jpg)
   
</details>

---

***Задание 2. Отправка и получение сообщений***

Используя приложенные скрипты, проведите тестовую отправку и получение сообщения. Для отправки сообщений необходимо запустить скрипт producer.py.

```
#!/usr/bin/env python
# coding=utf-8
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()
channel.queue_declare(queue='hello')
channel.basic_publish(exchange='', routing_key='hello', body='Hello Netology!')
connection.close()
```

Для работы скриптов вам необходимо установить Python версии 3 и библиотеку Pika. Также в скриптах нужно указать IP-адрес машины, на которой запущен RabbitMQ, заменив localhost на нужный IP.

$ pip install pika
Зайдите в веб-интерфейс, найдите очередь под названием hello и сделайте скриншот. После чего запустите второй скрипт consumer.py 

```
#!/usr/bin/env python
# coding=utf-8
import pika

connection = pika.BlockingConnection(pika.ConnectionParameters('localhost'))
channel = connection.channel()
channel.queue_declare(queue='hello')


def callback(ch, method, properties, body):
    print(" [x] Received %r" % body)


channel.basic_consume(callback, queue='hello', no_ack=True)
channel.start_consuming()
```

и сделайте скриншот результата выполнения скрипта

В качестве решения домашнего задания приложите оба скриншота, сделанных на этапе выполнения.

`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_04_SYSDB/11_04_2.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_04_SYSDB/11_04_2_.jpg)
   
</details>


---

***Задание 3. Подготовка HA кластера***

Используя Vagrant или VirtualBox, создайте вторую виртуальную машину и установите RabbitMQ. Добавьте в файл hosts название и IP-адрес каждой машины, чтобы машины могли видеть друг друга по имени.

Пример содержимого hosts файла:
```
$ cat /etc/hosts
192.168.0.10 rmq01
192.168.0.11 rmq02
```
После этого ваши машины могут пинговаться по имени.

Затем объедините две машины в кластер и создайте политику ha-all на все очереди.

В качестве решения домашнего задания приложите скриншоты из веб-интерфейса с информацией о доступных нодах в кластере и включённой политикой.

Также приложите вывод команды с двух нод:

$ rabbitmqctl cluster_status
Для закрепления материала снова запустите скрипт producer.py и приложите скриншот выполнения команды на каждой из нод:

$ rabbitmqadmin get queue='hello'
После чего попробуйте отключить одну из нод, желательно ту, к которой подключались из скрипта, затем поправьте параметры подключения в скрипте consumer.py на вторую ноду и запустите его.

Приложите скриншот результата работы второго скрипта.


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/11_02_SYSDB/11_2_2_.jpg)
   
</details>

***КОНЕЦ***
