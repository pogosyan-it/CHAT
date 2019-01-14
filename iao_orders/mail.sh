#!/bin/bash
mkdir -p /home/it/scripts/iao_orders/Archiv
#data=$(date +%Y-%m-%d)
#echo $data

echo "См. вложения" | mail -s "Список заказов" -a *.txt -r "gsot.corp@ws" smk@dmcorp.ru
echo "См. вложения" | mail -s "Список заказов" -a *.txt -r "gsot.corp@ws" boss-iao@dmcorp.ru
mv *.txt /home/it/scripts/iao_orders/Archiv
