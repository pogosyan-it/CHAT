#!/bin/bash
curdate="`date \+\%Y-\%m-\%d`"
 
dir1="/var/www/files/Not_in_List"
dir2="/var/www/files/Not_assign"
php /var/www/Not_in_list_new.php
res2=`cat $dir2/"$curdate"_Not_Assign.txt | wc -l`
res1=`cat $dir1/"$curdate"_Not_in_List.txt | wc -l`

if [ $res1 -gt 1 ]
then
      echo "См. вложения" | mail -s "Нет в ДЛ" -a $dir1/"$curdate"_Not_in_List.txt -r "gsot@corp.ws" smk@dmcorp.ru
      echo "См. вложения" | mail -s "Нет в ДЛ" -a $dir1/"$curdate"_Not_in_List.txt -r "gsot@corp.ws" archive@dmcorp.ru
else
      echo "За $curdate все накладные в ДЛ" | mail -s "Нет в ДЛ" -r "gsot@corp.ws" smk@dmcorp.ru 
      echo "За $curdate все накладные в ДЛ" | mail -s "Нет в ДЛ" -r "gsot@corp.ws" archive@dmcorp.ru      
      rm $dir1/"$curdate"_Not_in List.txt
fi           

if [ $res2 -gt 1 ]
then
      echo "См. вложения" | mail -s "Не назначены" -a $dir2/"$curdate"_Not_Assign.txt -r "gsot@corp.ws" smk@dmcorp.ru
      echo "См. вложения" | mail -s "Не назначены" -a $dir2/"$curdate"_Not_Assign.txt -r "gsot@corp.ws" archive@dmcorp.ru
else
      echo "За $curdate все накладные назначены" | mail -s "Не назначенные накладные" -r "gsot@corp.ws" smk@dmcorp.ru
      echo "За $curdate все накладные назначены" | mail -s "Не назначенные накладные" -r "gsot@corp.ws" archive@dmcorp.ru  
      rm $dir2/"$curdate"_Not_Assign.txt
fi
