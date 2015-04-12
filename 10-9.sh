#!/bin/bash
# findstring.sh:
# Поиск заданной строки в двоичном файле.

directory=/usr/local/bin/
fstring="Free Software Foundation"  # Поиск файлов от FSF.

for file in $( find $directory -type f -name '*' | sort )
do
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
