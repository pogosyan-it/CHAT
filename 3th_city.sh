#!/bin/bash
curdate="`date \+\%Y-\%m-\%d`" 
dir="/var/www/files/3th_city"
php /var/www/Examples/3th_city_Excel.php
      echo "См. вложения" | mail -s "3-й Город за $curdate дату" -a $dir/$curdate.xls -r "gsot@corp.ws" gzapros@dmcorp.ru
      echo "См. вложения" | mail -s "3-й Город за $curdate дату" -a $dir/$curdate.xls -r "gsot@corp.ws" smk@dmcorp.ru
      #echo "См. вложения" | mail -s "3-й Город за $curdate дату" -a $dir/$curdate.xls -r "gsot@corp.ws" it@int.dmcorp.ru
      

