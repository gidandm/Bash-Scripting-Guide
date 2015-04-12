#!/bin/bash

#  Демонстрация противоречивости содержимого внутренних переменных "$*" и "$@",
#+ которая проявляется при изменении порядка заключения параметров в кавычки.
#  Демонстрация противоречивости, проявляющейся при изменении
#+ содержимого переменной IFS.


set -- "Первый один" "второй" "третий:один" "" "Пятый: :один"
# Установка аргументов $1, $2, и т.д.

echo

echo 'IFS по-умолчанию, переменная "$*"'
c=0
for i in "$*"               # в кавычках
do echo "$((c+=1)): [$i]"   # Эта строка остается без изменений во всех циклах.
	                            # Вывод аргументов.
			    done
			    echo ---

			    echo 'IFS по-умолчанию, переменная $*'
			    c=0
			    for i in $*                 # без кавычек
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    echo 'IFS по-умолчанию, переменная "$@"'
			    c=0
			    for i in "$@"
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    echo 'IFS по-умолчанию, переменная $@'
			    c=0
			    for i in $@
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    IFS=:
			    echo 'IFS=":", переменная "$*"'
			    c=0
			    for i in "$*"
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    echo 'IFS=":", переменная $*'
			    c=0
			    for i in $*
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    var=$*
			    echo 'IFS=":", переменная "$var" (var=$*)'
			    c=0
			    for i in "$var"
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    echo 'IFS=":", переменная $var (var=$*)'
			    c=0
			    for i in $var
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    var="$*"
			    echo 'IFS=":", переменная $var (var="$*")'
			    c=0
			    for i in $var
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    echo 'IFS=":", переменная "$var" (var="$*")'
			    c=0
			    for i in "$var"
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    echo 'IFS=":", переменная "$@"'
			    c=0
			    for i in "$@"
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    echo 'IFS=":", переменная $@'
			    c=0
			    for i in $@
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    var=$@
			    echo 'IFS=":", переменная $var (var=$@)'
			    c=0
			    for i in $var
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    echo 'IFS=":", переменная "$var" (var=$@)'
			    c=0
			    for i in "$var"
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    var="$@"
			    echo 'IFS=":", переменная "$var" (var="$@")'
			    c=0
			    for i in "$var"
			    do echo "$((c+=1)): [$i]"
			    done
			    echo ---

			    echo 'IFS=":", переменная $var (var="$@")'
			    c=0
			    for i in $var
			    do echo "$((c+=1)): [$i]"
			    done

			    echo

			    # Попробуйте запустить этот сценарий под ksh или zsh -y.

			    exit 0
