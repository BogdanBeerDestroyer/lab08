# Шумилишский ИУ8-22 Лабораторная 8


## Tutorial


```sh
$ export GITHUB_USERNAME=BogdanBeerDestroyer
```

```
$ cd ${GITHUB_USERNAME}/workspace
$ pushd .
$ source scripts/activate
```

```sh
$ git clone https://github.com/${GITHUB_USERNAME}/lab07 lab08
$ cd lab08
$ git submodule update --init
$ git remote remove origin
$ git remote add origin https://github.com/${GITHUB_USERNAME}/lab08
```
В файле Dockerfile указываем операционную систему и версию

```sh
$ cat > Dockerfile <<EOF
FROM ubuntu:18.04
EOF
```
Задаем докеру что делать при запуске ВМ (обновления системы и установка пакетов)

```sh
$ cat >> Dockerfile <<EOF
RUN apt update
RUN apt install -yy gcc g++ cmake
EOF
```
Задаем текущий каталог
```sh
$ cat >> Dockerfile <<EOF
COPY . print/
WORKDIR print
EOF
```
Собираем смэйк

```sh
$ cat >> Dockerfile <<EOF
RUN cmake -H. -B_build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install
EOF
```
env = export 

```sh
$ cat >> Dockerfile <<EOF
ENV LOG_PATH /home/logs/log.txt
EOF
```
Создаем доп.каталог для logs
```sh
$ cat >> Dockerfile <<EOF
VOLUME /home/logs
EOF
```
Создаем WORKDIR
```sh
$ cat >> Dockerfile <<EOF
WORKDIR _install/bin
EOF
```
Эта команда вызывает утилиту demo, что была создана в предыдущих лабораторных. 

```sh
$ cat >> Dockerfile <<EOF
ENTRYPOINT ./demo
EOF
```

Вызываем утилиту docker. -t это тег. тег - logger
```sh
$ docker build -t logger .
```
Позволяет вывести (просмотреть) список, тех  ВМ, что есть

```sh
$ docker images
```

```sh 
$ mkdir logs
$ docker run -it -v "$(pwd)/logs/:/home/logs/" logger
text1
text2
text3
<C-D>
```
docker inspect logger - показывает, что происходит с машиной

```sh
$ docker inspect logger
```
cat logs/log.txt позволяет посмотреть, что утилита вывела в лог
```sh
$ cat logs/log.txt
```
Заменяем README.md 
```sh
$ gsed -i 's/lab07/lab08/g' README.md
```
Редактируем тревис для запуска докера
```sh
$ vim .travis.yml
/lang<CR>o
services:
- docker<ESC> //  сама клавиша
jVGdo
script:
- docker build -t logger .<ESC>
:wq
```

```sh
$ git add Dockerfile
$ git add .travis.yml
$ git commit -m"adding Dockerfile"
$ git push origin master
```
19. Нужно сделать Docker работающим внутри travis'а. Выполянем это.
```sh
$ travis login --auto
$ travis enable
```
