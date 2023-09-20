## Домашнее задание к занятию "`Индексы`" - `Камаев Евгений`

***Задание 1***

Напишите запрос к учебной базе данных, который вернёт процентное отношение общего размера всех индексов к общему размеру всех таблиц.

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

Выполните explain analyze следующего запроса:

```
select distinct concat(c.last_name, ' ', c.first_name), sum(p.amount) over (partition by c.customer_id, f.title)
from payment p, rental r, customer c, inventory i, film f
where date(p.payment_date) = '2005-07-30' and p.payment_date = r.rental_date and r.customer_id = c.customer_id and i.inventory_id = r.inventory_id
```

перечислите узкие места;
оптимизируйте запрос: внесите корректировки по использованию операторов, при необходимости добавьте индексы.

`Решение`

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_05_SDBSQL/12_05_2.jpg)
  
</details>

***КОНЕЦ***
