#!/bin/bash
# bin-grep.sh: Поиск строк в двоичных файлах.

# замена "grep" для бинарных файлов.
# Аналогично команде "grep -a"

E_BADARGS=65
E_NOFILE=66

if [ $# -ne 2 ]
then
	echo "Порядок использования: `basename $0` string filename"
	exit $E_BADARGS
fi

if [ ! -f "$2" ]
then
	echo "Файл \"$2\" не найден."
	exit $E_NOFILE
fi

for word in $( strings "$2" | grep "$1" )
# Инструкция "strings" возвращает список строк в двоичных файлах.
# Который затем передается по конвейеру команде "grep", для выполнения поиска.
do
	echo $word
done

# Как указывает S.C., вышепрведенное объявление цикла for может быть упрощено
#    strings "$2" | grep "$1" | tr -s "$IFS" '[\n*]'

# Попробуйте что нибудь подобное:  "./bin-grep.sh mem /bin/ls"
exit 0
