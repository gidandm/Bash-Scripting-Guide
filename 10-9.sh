#!/bin/bash
# findstring.sh:
# Поиск заданной строки в двоичном файле.

#directory=/usr/local/bin/
#fstring="Free Software Foundation"  # Поиск файлов от FSF.

# замена "grep" для бинарных файлов.
# Аналогично команде "grep -a"

E_BADARGS=65
E_NODIR=66

if [ $# -ne 2 ]
then
  echo "Порядок использования: `basename $0` string filename"
  exit $E_BADARGS
fi

if [ ! -d "$2" ]
then
  echo "Директория \"$2\" не найдена."
  exit $E_NODIR
fi

directory="$2"
fstring="$1" # Поиск файлов от FSF.

for file in $( find $directory -type f -name '*' | sort )
do
  #strings -f $file | grep "$fstring" | sed -e "s%$directory%%"
  strings -f $file | grep "$fstring" | sed -e "s%$directory%%"
  #  Команде "sed" передается выражение (ключ -e),
  #+ для того, чтобы изменить обычный разделитель "/" строки поиска и строки замены
  #+ поскольку "/" - один из отфильтровываемых символов.
  #  Использование такого символа порождает сообщение об ошибке (попробуйте).
done

exit 0

#  Упражнение:
#  ---------------
#  Измените сценарий таким образом, чтобы он брал
#+ $directory и $fstring из командной строки.
