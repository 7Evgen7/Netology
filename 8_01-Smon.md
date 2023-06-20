## Домашнее задание к занятию "`Обзор систем IT-мониторинга`" - `Камаев Евгений`


***Задание 1***


1. Зарегистрируйте аккаунт на GitHub.

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_1.jpg)
   
</details>


2.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_2.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_2_.jpg)   

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_2_1.jpg)   
   
</details>

3. 

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_3.jpg)

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_3_.jpg)
   
</details>

4.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_4.jpg)

</details>

5.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_5.jpg)

</details>

6.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_6.jpg)

</details>

7. Отредактируйте файл README.md любым удобным способом, переведя файл в состояние Modified.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_7.jpg)

</details>

8. Ещё раз выполните `git status` и продолжайте проверять вывод этой команды после каждого следующего шага.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_8.jpg)

</details>

9. Посмотрите изменения в файле README.md, выполнив команды `git diff` и `git diff --staged`.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_9.jpg)

</details>

10. Переведите файл в состояние staged или, как говорят, добавьте файл в коммит, командой `git add README.md`.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_10.jpg)

</details>

11. Ещё раз выполните команды `git diff` и `git diff --staged`.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_11.jpg)

</details>

12. Теперь можно сделать коммит `git commit -m 'First commit'`.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_12.jpg)

</details>

13. Сделайте `git push origin master`.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_13.jpg)

</details>

В качестве ответа добавьте ссылку на этот коммит в ваш md-файл с решением.

<details>
   
![Commit "edit README.md"](https://github.com/7Evgen7/Git/commit/aeb92d3e176003ec37acc92db71b5e00a3adce89)
   
</details>

---

***Задание 2***

Что нужно сделать:
1. Создайте файл .gitignore (обратите внимание на точку в начале файла) и проверьте его статус сразу после создания.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_2_1.jpg)

</details>

2. Добавьте файл .gitignore в следующий коммит `git add....`

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_2_2.jpg)

</details>

3. Напишите правила в этом файле, чтобы игнорировать любые файлы `.pyc`, а также все файлы в директории `cache`.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_2_3.jpg)

</details>

4. Сделайте `commit` и `push`.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_2_4.jpg)
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_2_4_.jpg)

</details>

В качестве ответа добавьте ссылку на этот коммит в ваш md-файл с решением.

<details>
   
![Commit and push .gitignore](https://github.com/7Evgen7/Git/commit/85a5d80cd2cdafc56ae0d3f6ce4cd7eee721bcf3)
   
</details>

---

***Задание 3***
Что нужно сделать:

1. Создайте новую ветку dev и переключитесь на неё.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_3_1.jpg)

</details>

2. Создайте файл test.sh с произвольным содержимым.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_3_2.jpg)

</details>

3. Сделайте несколько commit и push, имитируя активную работу над этим файлом.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_3_3.jpg)

</details>

4. Сделайте merge этой ветки в основную. Сначала нужно переключиться на неё, а потом вызывать git merge.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_3_4.jpg)

</details>

5. Сделайте `commit` и `push`.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_3_5.jpg)

</details>

В качестве ответа прикрепите ссылку на graph commit https://github.com/7Evgen7/Git/network в ваш md-файл с решением.


**END**
