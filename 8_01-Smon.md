## Домашнее задание к занятию "`Обзор систем IT-мониторинга`" - `Камаев Евгений`

Создайте виртуальную машину в Yandex Compute Cloud и с помощью Yandex Monitoring создайте дашборд, на котором будет видно загрузку процессора.

***Задание 1***


1. В окне браузера откройте облачную платформу Yandex Cloud.

<details>
   
![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/8_01-Smon/9_01_1.jpg)
   
</details>


2. Перейдите в раздел "Все сервисы" > "Инфраструктура и сеть" > "Compute Cloud"

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_2.jpg)

</details>

3. Нажмите на синюю кнопку "Создать ВМ" в правом верхнем углу окна браузера.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_3.jpg)

</details>

4. Задайте имя виртуальной машины. Используйте английские буквы и цифры.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_4.jpg)

</details>

5. Выберите операционную систему Debian 11.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_5.jpg)

</details>

6. Установите объём HDD равный 3ГБ.
7. Выберите платформу Intel Ice Lake.
8. Установите количество vCPU равное 2.
9. Установите гарантированную долю vCPU равную 20%.
10. Задайте количество RAM равное 1ГБ.
11. Поставьте галочку "Прерываемая".

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_6.jpg)

</details>

12. В разделе "Доступ" выберите сервисный аккаунт с ролью `monitoring.editor.` Если такого аккаунта нету, нажмите на кнопку "Создать новый". Задайте имя аккаунта английскими буквами, напротив надписи "Роли в каталоге" нажмите на знак "плюс". Прокручивая колесо мыши на себя, найдите роль `monitoring.editor` и нажмите на неё левой кнопкой мыши. Теперь вы сможете найти только что созданную роль в выпадающем списке аккаунтов.
13. Задайте логин учётной записи вашей виртуальной машины.
14. Вставьте публичный SHH-ключ в поле SSH-ключ. Если этого ключа у вас нету, создайте его с помощью утилиты `PuTTYgen`.
15. Поставьте галочку "Установить" в пункте "Агент сбора метрик".

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_7.jpg)

</details>

16. Нажмите на синюю кнопку `"Создать ВМ"`.

<details>

![Screnshot](https://github.com/7Evgen7/Netology/blob/main/JPG/7_05-Git/7_05_1_8.jpg)

</details>

17. Перейдите в раздел "Все сервисы" > "Инфраструктура и сеть" > "Monitoring".

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
