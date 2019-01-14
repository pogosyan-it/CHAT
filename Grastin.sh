#!/bin/bash

dir="/var/www/files/DOCK_reports/Grastin/P_Return/Returns"
cd $dir

curdate="`date \+\%Y-\%m-\%d`"
#file_name="$curdate"_dock.txt

#while read line
#  do
# sed -i "s/\$waybill=.*/\$waybill="${line}"/" /var/www/Grastin_Partly.php    
#php /var/www/Grastin_Partly.php

#done < $file_name

#file_name1="$curdate"_return.txt

#while read line
#  do
# sed -i "s/\$waybill=.*/\$waybill="${line}"/" /var/www/Grastin_Returns.php
#php /var/www/Grastin_Returns.php

#done < $file_name1

#rm $dir/$file_name

php /var/www/Grastin_DOCK_NEW.php

num=$(cat return_list_$curdate.txt | wc -l)
echo "NUM=$num"

if [[ $num  -gt 0 ]]; then
    
 echo "Letter was SENT"

 echo "См. вложения" | mail -s "Возвраты Грастин" -a $dir/"return_list_$curdate.txt" -r "courier@dock.dimex.ws" direktor@dock.dimex.ws
 echo "См. вложения" | mail -s "Возвраты Грастин" -a $dir/"return_list_$curdate.txt" -r "courier@dock.dimex.ws" prodaji@dock.dimex.ws
 echo "См. вложения" | mail -s "Возвраты Грастин" -a $dir/"return_list_$curdate.txt" -r "courier@dock.dimex.ws" it@corp.dimex.ws

else 
     echo "Letter NOT SENT"
      #rm return_list_$curdate.txt
       echo "Возвратов нет" | mail -s "Возвраты Грастин" -r "courier@dock.dimex.ws" direktor@dock.dimex.ws
       echo "Возвратов нет" | mail -s "Возвраты Грастин" -r "courier@dock.dimex.ws" prodaji@dock.dimex.ws
       echo "Возвратов нет" | mail -s "Возвраты Грастин"  -r "courier@dock.dimex.ws" it@corp.dimex.ws
fi
