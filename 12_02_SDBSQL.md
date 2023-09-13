## Домашнее задание к занятию "`Работа с данными (DDL/DML)`" - `Камаев Евгений`

***Задание 1***

1.1. Поднимите чистый инстанс MySQL версии 8.0+. Можно использовать локальный сервер или контейнер Docker.


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_1_1.jpg)
   
</details>


1.2. Создайте учётную запись sys_temp.


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_1_2.jpg)
   
</details>


1.3. Выполните запрос на получение списка пользователей в базе данных. (скриншот)


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_1_3.jpg)
   
</details>


1.4. Дайте все права для пользователя sys_temp.


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_1_4.jpg)
   
</details>


1.5. Выполните запрос на получение списка прав для пользователя sys_temp. (скриншот)


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_1_5.jpg)
   
</details>


1.6. Переподключитесь к базе данных от имени sys_temp.


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_1_6.jpg)
   
</details>


Для смены типа аутентификации с sha2 используйте запрос:

ALTER USER 'sys_test'@'localhost' IDENTIFIED WITH mysql_native_password BY 'password';
1.6_. По ссылке https://downloads.mysql.com/docs/sakila-db.zip скачайте дамп базы данных.


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_1_6_.jpg)
   
</details>


1.7. Восстановите дамп в базу данных.

`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_1_7.jpg)
   
</details>


1.8. При работе в IDE сформируйте ER-диаграмму получившейся базы данных. При работе в командной строке используйте команду для получения всех таблиц базы данных. (скриншот)

Результатом работы должны быть скриншоты обозначенных заданий, а также простыня со всеми запросами.


`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_1_8.jpg)
   
</details>


---

***Задание 2***

Составьте таблицу, используя любой текстовый редактор или Excel, в которой должно быть два столбца: в первом должны быть названия таблиц восстановленной базы, во втором названия первичных ключей этих таблиц. Пример: (скриншот/текст)

Название таблицы | Название первичного ключа
customer         | customer_id

`Решение`

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_2_2.jpg)
   
</details>

А если проконсультироваться у умного товарища, то можно сотворить следующее:


<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_2_2_.jpg)
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_02_SDBSQL/12_02_2_2__.jpg)
   
</details>

***КОНЕЦ***
