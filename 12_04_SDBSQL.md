***Задание 1***


Одним запросом получите информацию о магазине, в котором обслуживается более 300 покупателей, и выведите в результат следующую информацию:

фамилия и имя сотрудника из этого магазина;
город нахождения магазина;
количество пользователей, закреплённых в этом магазине.

`Решение`

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_04_SDBSQL/12_04_1.jpg)
  
</details>

'''
SELECT concat (s.first_name  , ' ', s.last_name) as Имя , c.city,  count (c2.customer_id) as Количество 
FROM staff s 
JOIN address a  ON s.address_id = a.address_id 
JOIN city c  ON a.city_id = c.city_id 
JOIN store s2 ON s2.store_id = s.store_id 
JOIN customer c2 ON s2.store_id = c2.store_id 
GROUP BY s.first_name , s.last_name , c.city 
HAVING Количество > 300;
'''

---

***Задание 2***

Получите количество фильмов, продолжительность которых больше средней продолжительности всех фильмов.

`Решение`

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_04_SDBSQL/12_04_2.jpg)
  
</details>

'''
SELECT  count(`length`) 
FROM film 
WHERE `length` > (SELECT avg(`length`) FROM film);
'''

---

Задание 3
Получите информацию, за какой месяц была получена наибольшая сумма платежей, и добавьте информацию по количеству аренд за этот месяц.

`Решение`

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/12_04_SDBSQL/12_04_3.jpg)
  
</details>

'''
SELECT DATE_FORMAT (p.payment_date, '%Y-%M') AS Дата , (sum (p.amount)) AS Сумма , count ((p.rental_id)) AS Аренд
FROM payment p 
GROUP BY Дата
ORDER BY Сумма DESC
LIMIT 1;
'''

**КОНЕЦ**
