#!/bin/bash
curdate="`date \+\%Y-\%m-\%d`" 
dir="/var/www/files/test"
php /var/www/Instructions.php
cd $dir
res=`cat "$curdate"_Less_50_char.txt | wc -l`
echo $res
if [ $res -gt 1 ]
then
       echo "См. вложения" | mail -s "SPEC_Instr_Change" -a $dir/"$curdate"_More_50_char.txt -r "gsot.corp@ws" smk@dmcorp.ru
       echo "См. вложения" | mail -s "Spec_Instr_Change" -a $dir/"$curdate"_Less_50_char.txt -r "gsot.corp@ws" smk@dmcorp.ru
       mkdir -p $dir/Archive
       mv *.txt Archive
else
      echo "За $curdate число ни одной накладной не отредактировано" | mail -s "Список отредактированных накладных" -r "gsot.corp@ws" smk@dmcorp.ru
fi           
