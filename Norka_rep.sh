#!/bin/bash
curdate="`date \+\%Y-\%m-\%d`" 
dir="/var/www/files/Norka_Rep"
cd $dir

#echo "См. вложения" | mail -s "Отчеты NORK за $curdate" -a $dir/"$curdate"_*00.xls -r "gsot@corp.ws" smk@dmcorp.ru
#echo "См. вложения" | mail -s "Отчеты NORK за $curdate" -a $dir/"$curdate"_*.xls -r "gsot@corp.ws" it@int.dmcorp.ru
echo "См. вложения" | mail -s "Отчеты NORK за $curdate" -a $dir/"$curdate"_*.xls -r "gsot@corp.ws" smk@dmcorp.ru
echo "См. вложения" | mail -s "Отчеты NORK за $curdate" -a $dir/"$curdate"_*.xls -r "gsot@corp.ws" stp@dmcorp.ru
echo "См. вложения" | mail -s "Отчеты NORK за $curdate" -a $dir/"$curdate"_*.xls -r "gsot@corp.ws" hsd@dmcorp.ru
echo "См. вложения" | mail -s "Отчеты NORK за $curdate" -a $dir/"$curdate"_*.xls -r "gsot@corp.ws" direktor@corp.dimex.ws
