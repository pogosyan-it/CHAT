#!/bin/bash
curdate="`date \+\%Y-\%m-\%d`" 
dir1="/var/www/files/BH_MOW_DOCK/MOW/$curdate"
dir2="/var/www/files/BH_MOW_DOCK/DOCK/$curdate"
res1=`cat $dir1/BH_MOW.txt | wc -l`
res2=`cat $dir2/BH_DOCK.txt | wc -l`
if [ $res1 -gt 1 ] && [ $res2 -gt 1 ]; then
       echo "См. вложения" | mail -s "Передать в МСК и ДОК $curdate" -a $dir1/BH_MOW.txt -a $dir2/BH_DOCK.txt -r "gsot@corp.ws" gzapros@dmcorp.ru
      # echo "См. вложения" | mail -s "Передать в DOCK и МСК $curdate" -a $dir1/BH_MOW.txt -a $dir2/BH_DOCK.txt -r "gsot@corp.ws" it@int.dmcorp.ru
elif  [ $res1 -gt 1 ] && [ $res2 -eq 0 ]; then
       echo "См. вложения" | mail -s "Передать в MCK $curdate" -a $dir1/BH_MOW.txt -r "gsot@corp.ws" gzapros@dmcorp.ru
       #echo "См. вложения" | mail -s "Передать в MCK $curdate" -a $dir1/BH_MOW.txt -r "gsot@corp.ws" it@int.dmcorp.ru
elif  [ $res2 -gt 1 ] && [ $res1 -eq 0 ]; then
       echo "См. вложения" | mail -s "Передать в ДОК $curdate" -a $dir2/BH_DOCK.txt -r "gsot@corp.ws" gzapros@dmcorp.ru
       #echo "См. вложения" | mail -s "Передать в ДОК $curdate" -a $dir2/BH_DOCK.txt -r "gsot@corp.ws" it@int.dmcorp.ru
else
       echo "За $curdate число ни одной накладной не отредактировано" | mail -s "BH_MOW_DOCK" -r "gsot@corp.ws" gzapros@dmcorp.ru
      # echo "За $curdate число ни одной накладной не отредактировано" | mail -s "BH_MOW_DOCK" -r "gsot@corp.ws" it@int.dmcorp.ru
fi           
