#!/bin/bash
curdate="`date \+\%Y-\%m-\%d`" 
dir="/var/www/files/Delivery_check"
php /var/www/Delivery_check.php
res=`cat $dir/$curdate.txt | wc -l`
if [ $res -gt 1 ]
  then  
      mv $dir/$curdate.txt $dir/tmp
      let num=$res-1
      for i in `cat $dir/tmp/$curdate.txt | awk '{print $1}' | tail -n $num`; do
         count=$(grep $i $dir/*.txt | wc -l)
         echo $count
         if [[ $count -eq 0 ]]; then
             grep $i $dir/tmp/$curdate.txt >> $dir/$curdate.txt
             rm $dir/tmp/$curdate.txt 
         else 
             echo "Number is not uniq"
         fi
                                                                              done

       fin_res=`cat $dir/$curdate.txt | wc -l`
   if [ $fin_res -gt 1 ]
  then
       echo "См. вложения" | mail -s "Повторно исполненные доставки" -a $dir/$curdate.txt -r "gsot@corp.ws" smk@dmcorp.ru
       echo "См. вложения" | mail -s "Повторно исполненные доставки" -a $dir/$curdate.txt -r "gsot@corp.ws" archive@dmcorp.ru
  else
      echo "За последний 31 день  не было ни одной доставки исполненной повторно" | mail -s "Повторно исполненные доставки" -r "gsot@corp.ws" smk@dmcorp.ru
      rm $dir/$curdate.txt
   fi           
else
    
      echo "За последний 31 день  не было ни одной доставки исполненной повторно" | mail -s "Повторно исполненные доставки" -r "gsot@corp.ws" smk@dmcorp.ru
      rm $dir/$curdate.txt
fi

