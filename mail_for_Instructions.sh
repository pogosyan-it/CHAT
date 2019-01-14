#!/bin/bash
curdate="`date \+\%Y-\%m-\%d`" 
dir1="/var/www/files/test/Zakazy"
dir2="/var/www/files/test/Dostavki"
res1=`cat $dir1/"$curdate"_More_Zakazy.txt | wc -l`
res2=`cat $dir2/"$curdate"_More_Dostavki.txt | wc -l`
echo $res1
echo $res2
if [ $res1 -gt 1 ]
then
      echo "См. вложения" | mail -s "Спец. Инструкции и Примечания - Заказы" -a $dir1/"$curdate"_More_Zakazy.txt -r "gsot@corp.ws" gzapros@dmcorp.ru
      mv $dir1/*.txt $dir1/Sended
else
     rm $dir1/"$curdate"_More_Zakazy.txt
fi

if [ $res2 -gt 1 ]
then
      echo "См. вложения" | mail -s "Спец. Инструкции и Примечания - Доставки" -a $dir2/"$curdate"_More_Dostavki.txt -r "gsot@corp.ws" gzapros@dmcorp.ru
      mv $dir2/*.txt $dir2/Sended
else
     rm $dir2/"$curdate"_More_Dostavki.txt
fi
