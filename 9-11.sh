#!/bin/bash
#  cvt.sh:
#  Преобразование всех файлов в заданном  каталоге,
#+ из графического формата MacPaint, в формат "pbm".

#  Используется утилита "macptopbm", входящая в состав пакета "netpbm",
#+ который сопровождается Brian Henderson (bryanh@giraffe-data.com).
#  Netpbm -- стандартный пакет для большинства дистрибутивов Linux.

OPERATION=macptopbm
SUFFIX=pbm          # Новое расширение файла.

if [ -n "$1" ]
then
	  directory=$1      # Если каталог задан в командной строке при вызове сценария
else
    directory=$PWD    # Иначе просматривается текущий каталог.
fi

#  Все файлы в каталоге, имеющие расширение ".mac", считаются файлами
#+ формата  MacPaint.

for file in $directory/* # Подстановка имен файлов.
do
	existF=${file:(-3)} 
	echo ${existF}
	if [[ "${existF}x" = "macx" ]]
	then
      filename=${file%.mac}   #  Удалить расширение ".mac" из имени файла
      #+ ( с шаблоном '.*c' совпадают все подстроки
      #+ начинающиеся с '.' и заканчивающиеся 'c',
      $OPERATION $file > "$filename.$SUFFIX"
      # Преобразование с перенаправлением в файл с новым именем
      rm -f $file            # Удаление оригинального файла после преобразования.
      echo "$filename.$SUFFIX"  # Вывод на stdout.
      else
	      echo "---------------------------"
      fi
done
exit 0
