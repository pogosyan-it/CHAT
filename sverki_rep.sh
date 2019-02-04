#!/bin/bash

dir="/var/www/files/Sverki/Reports"
echo $curdate
num=`cat $(find $dir -maxdepth 1 -type f  -mtime -1) | wc -l`
echo "NUM=$num"
name=`find $dir -maxdepth 1 -type f  -mtime -1`

echo "NAME=$name"

if [ $num -ge 1 ]; then
        echo "См. вложения" | mail -s "Отчеты по внесённым суммам" -a $name -r "gsot@corp.ws" gsverki@dmcorp.ru
        echo "См. вложения" | mail -s "Отчеты по внесённым суммам" -a $name -r "gsot@corp.ws" it@int.dmcorp.ru
else
       rm  $name
       echo "file is empty"
fi

ssh -T 10.10.1.4 << EOF                
file1="/media/landisc/corp/TARIF/transport.xls"
file2="/media/landisc/corp/TARIF/Tariff.xls"
for file in "$file1" "$file2"
do
   if [ -f $file ]; then
       echo "FILE $file EXISTS"
       rm $file
   else
      echo "FILE $file DOESN'T EXIST"
   fi
done
exit                            
EOF
