#!/bin/bash
curdate="`date \+\%Y-\%m-\%d`"
 
dir1="/var/www/files/Not_in_Manifest"
dir2="/var/www/files/2_Manifest"
php /var/www/Not_in_Manifest.php
res2=`cat $dir2/"$curdate"_2_Manifest.txt | wc -l`
res1=`cat $dir1/"$curdate"_Not_in_Manifest.txt | wc -l`
echo $res1
if [ $res1 -gt 1 ]
then
      echo "См. вложения" | mail -s "Отсканированы, не в манифесте." -a $dir1/"$curdate"_Not_in_Manifest.txt -r "gsot@corp.ws" smk@dmcorp.ru
else
      echo "За $curdate все накладные в манифестах" | mail -s "Отсканированы, не в манифесте." -r "gsot@corp.ws" smk@dmcorp.ru
      rm $dir1/"$curdate"_Not_in_Manifest.txt
fi           
if [ $res2 -gt 1 ]
then
      echo "См. вложения" | mail -s "Накладные в 2-х и более манифестах" -a $dir2/"$curdate"_2_Manifest.txt -r "gsot@corp.ws" smk@dmcorp.ru 
else
      echo "За $curdate нет накладных одновременно находящихся в 2-х и более манифестах" | mail -s "Накладные в 2-х и более манифестах" -r "gsot@corp.ws" smk@dmcorp.ru
      rm $dir2/"$curdate"_2_Manifest.txt
fi
