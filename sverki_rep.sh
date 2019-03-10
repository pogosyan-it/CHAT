#!/bin/bash

dir="/var/www/files/Sverki/Reports"
echo $curdate
num=`cat $(find $dir -maxdepth 1 -type f  -mtime -1) | wc -l`
echo "NUM=$num"
name=`find $dir -maxdepth 1 -type f  -mtime -1`

echo "NAME=$name"

if [ $num -ge 1 ]; then
#        echo "См. вложения" | mail -s "Отчеты по внесённым суммам" -a $name -r "gsot@corp.ws" gsverki@dmcorp.ru
        echo "См. вложения" | mail -s "Отчеты по внесённым суммам" -a $name -r "gsot@corp.ws" it@int.dmcorp.ru
else
       rm  $name
       echo "file is empty"
fi

ssh -T 10.10.1.4 << EOF
    bash /home/it/scripts/rm_tariffs.sh
EOF
