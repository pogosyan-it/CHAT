#!/bin/bash
curdate="`date \+\%Y-\%m-\%d`" 
dir1="/var/www/files/Zakazy"
dir2="/var/www/files/Tranzity"
mkdir -p $dir1/$curdate
mkdir -p $dir2/$curdate

php /var/www/ABR_Change_Zakazy.php
php /var/www/ABR_Change_Tranzity.php
res1=`cat $dir1/"$curdate"_Zakazy.txt | wc -l`
res2=`cat $dir2/"$curdate"_Tranzity.txt | wc -l`
echo $res1, $res2
if [ $res1 -gt 1 ]
then
      echo "См. вложения" | mail -s "Схемы отправок-Заказы" -a $dir1/"$curdate"_Zakazy.txt -r "gsot@corp.ws" gzapros@dmcorp.ru
      echo "См. вложения" | mail -s "Схемы отправок-Заказы" -a $dir1/"$curdate"_Zakazy.txt -r "gsot@corp.ws" smk@dmcorp.ru
      if [ -f $dir1/$curdate/"$curdate"_Zakazy.txt ] 
         then
               cat  $dir1/"$curdate"_Zakazy.txt | tail -n +2  >> $dir1/$curdate/"$curdate"_Zakazy.txt
               rm  $dir1/"$curdate"_Zakazy.txt
         else
               mv $dir1/"$curdate"_Zakazy.txt $dir1/$curdate
      fi
      
else
      echo "За $curdate число ни одной накладной не отредактировано" | mail -s "Схемы отправок" -r "gsot.corp@ws" gzapros@dmcorp.ru
      rm $dir1/"$curdate"_Zakazy.txt
fi           

if [ $res2 -gt 1 ]
then
      echo "См. вложения" | mail -s "Схемы отправок-Транзиты" -a $dir2/"$curdate"_Tranzity.txt -r "gsot@corp.ws" gzapros@dmcorp.ru
      echo "См. вложения" | mail -s "Схемы отправок-Tranzity" -a $dir2/"$curdate"_Tranzity.txt -r "gsot@corp.ws" smk@dmcorp.ru
      if [ -f $dir2/$curdate/"$curdate"_Tranzity.txt ]
         then
               cat  $dir2/"$curdate"_Tranzity.txt | tail -n +2  >> $dir2/$curdate/"$curdate"_Tranzity.txt
               rm  $dir2/"$curdate"_Tranzity.txt
         else
               mv $dir2/"$curdate"_Tranzity.txt $dir2/$curdate
      fi
else
      echo "За $curdate число ни одной накладной не отредактировано" | mail -s "Схемы отправок" -r "gsot.corp@ws" gzapros@dmcorp.ru
      rm $dir2/"$curdate"_Tranzity.txt
fi
