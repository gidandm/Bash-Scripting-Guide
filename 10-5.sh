#!/bin/bash

# Попробуйте вызвать этот сценарий с аргументами и без них и посмотреть на результаты.

for a
do
	 echo -n "$a "
 done

 #  Список аргументов не задан, поэтому цикл работает с переменной '$@'
 #+ (список аргументов командной строки, включая пробельные символы).

 echo

 exit 0
