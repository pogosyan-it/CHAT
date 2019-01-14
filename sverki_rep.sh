#!/bin/bash

#curdate="`date \+\%Y_\%m_\%d`"
#dir="/var/www/files/Sverki/Reports"

#num=$(ls -l $dir | awk '{print$9}' | tail -n 1 | wc -l)
#name=$(ls -l $dir | awk '{print$9}' | tail -n 1)
#if [[ $num -ge 1 ]]; then
#       echo "См. вложения" | mail -s "Отчеты по внесённым суммам" -a $dir/$name -r "gsot@corp.ws" gsverki@dmcorp.ru
#       echo "См. вложения" | mail -s "Отчеты по внесённым суммам" -a $dir/$name -r "gsot@corp.ws" it@int.dmcorp.ru
#fi
#       rm $dir/$name


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
