#!/bin/bash
curdate="`date \+\%Y-\%m-\%d`" 
dir="/var/www/files/NewManifest"
php /var/www/New_Manifest.php
res=`cat $dir/"$curdate"_New_Manifest.txt | wc -l`
echo $res
if [ $res -gt 1 ]
then
      echo "См. вложения" | mail -s "Накладные находящиеся в New-манифестах более 48 часов" -a $dir/"$curdate"_New_Manifest.txt -r "gsot@corp.ws" smk@dmcorp.ru
      echo "См. вложения" | mail -s "Накладные находящиеся в New-манифестах более 48 часов" -a $dir/"$curdate"_New_Manifest.txt -r "gsot@corp.ws" boss-terminal@dmcorp.ru
      echo "См. вложения" | mail -s "Накладные находящиеся в New-манифестах более 48 часов" -a $dir/"$curdate"_New_Manifest.txt -r "gsot@corp.ws"  archive@dmcorp.ru
     # echo "См. вложения" | mail -s "BH_MOW_$curdate" -a $dir/BH_MOW.txt -r "gsot@corp.ws" it@int.dmcorp.ru
else
      echo "Все накладные закрыты" | mail -s "NEW_Manifest" -r "gsot@corp.ws" smk@dmcorp.ru
      echo "Все накладные закрыты" | mail -s "NEW_Manifest" -r "gsot@corp.ws" boss-terminal@dmcorp.ru
fi           
