## Домашнее задание к занятию "`Репликация и масштабирование. Часть 2`" - `Камаев Евгений`

***Задание 1***

Опишите основные преимущества использования масштабирования методами:

* активный master-сервер и пассивный репликационный slave-сервер;
* master-сервер и несколько slave-серверов;
* активный сервер со специальным механизмом репликации — distributed replicated block device (DRBD);
* SAN-кластер.
Дайте ответ в свободной форме.

`Решение`

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_05_SDBSQL/12_05_1.jpg)
  
</details>

```
SELECT table_schema AS 'DataBase' , 
CONCAT(ROUND((SUM(index_length) * 100 / SUM(data_length)), 2), ' ', '%' ) AS 'index/size'
FROM INFORMATION_SCHEMA.TABLES 
WHERE TABLE_SCHEMA = 'sakila';
```
---

***Задание 2***

Разработайте план для выполнения горизонтального и вертикального шаринга базы данных. База данных состоит из трёх таблиц:

пользователи,
книги,
магазины (столбцы произвольно).
Опишите принципы построения системы и их разграничение или разбивку между базами данных.

Пришлите блоксхему, где и что будет располагаться. Опишите, в каких режимах будут работать сервера.

`Решение`

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_05_SDBSQL/12_05_2_.jpg)
  
</details>

Узкие места:
*  применение функции over (partition by c.customer_id, f.title)
*  при выполнении функции попадает f.title , что явялется избыточным, так как таблица film не используется.

```
SELECT CONCAT(c.last_name, ' ', c.first_name) AS name, SUM(p.amount)
FROM payment p
join rental r on r.rental_date = p.payment_date 
join customer c on c.customer_id = r.customer_id
join inventory i on i.inventory_id = r.inventory_id
WHERE cast(p.payment_date as date) = '2005-07-30' and cast(p.payment_date as date) < '2005-07-31'
GROUP BY c.customer_id;
```

***КОНЕЦ***
