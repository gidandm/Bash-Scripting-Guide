#!/bin/bash
# length.sh

E_NO_ARGS=65

if [ $# -eq 0 ]  # Для работы скрипта необходим хотя бы один входной параметр.
then
  echo "Вызовите сценарий с одним или более параметром командной строки."
  exit $E_NO_ARGS
fi

var01=abcdEFGH28ij

echo "var01 = ${var01}"
echo "Length of var01 = ${#var01}"

echo "Количество входных параметров = ${#@}"
echo "Количество входных параметров = ${#*}"

exit 0
