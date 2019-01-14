#!bin/bash
#СКРИПТ АВТОМАТИЧЕСКОЙ ЗАМЕНЫ МАРШРУТА В НАКЛАДНЫХ, СПИСОК КОТОРЫХ ФОРМИРУЕТСЯ ИЗ php
dir1="/home/it/NAX"           #Рабочая папка програмы.
dir2="/var/www/to_X"          #Папка в которую складываются сформированные в php списки накладных, подлежащие изменеию маршрута.

Change_route() { 
                curdate="`date \+\%Y_\%m_\%d`"           
                date_time="`date \+\%Y_\%m_\%d_\%H_\%M`"
                mkdir -p $dir1/$curdate                              #создание папки если нет с датой, равной текущей.
                mkdir -p $dir1/$curdate/on_X                         #создание папки в которой содержутся данные по накладным и маршрутам  подлежащим изменению на маршрут Х.
                rm $dir1/$curdate/on_X/X_*.txt                       #удаление старых файлов, оставшися в директории при предыдущем проходе программы.
                #rm $dir1/TMP/old_*.txt
                 find $dir2 -name 'X_*.txt' | xargs mv -t $dir1/$curdate/on_X  2>/dev/null #поиск и перемещение вновь соформированных файлов 
                 cd $dir1/$curdate/on_X                        
      sed -i -e '$d' X_*.txt                                                    #Удаление пустых строк.                 
      cat X_*.txt >> Y_"$date_time".txt                                         #Формирование из нескольких файлов одного.
      rm X_*.txt                                                                #Удаление этих нескольких файлов.
      cat Y_*.txt | tr -d '\r' >> X_"$date_time".txt                            #Удаление в конце каждой строки символа \r
      rm Y_*.txt

    for name in `cat X_*.txt`; do                    #Цикл перебора строк в файле.
    #Отправка на сервер MySQL запросов, первый из которых сохраняет текущие маршруты, а второй меняет id маршрута на заданный (216)
    echo  "Select d15_departures.WayBillNum, hbc_routes.Name, d15_departures.R_RouteID from d15_departures left join hbc_routes on hbc_routes.ID=d15_departures.R_RouteID where d15_departures.WayBillNum='$name';"|mysql -h 10.10.1.2 -u root -pexhouqze gsotldb --disable-column-names >> $dir1/$curdate/on_X/old_R_"$date_time".txt 2>/dev/null
    echo  "Update d15_departures SET d15_departures.R_RouteID='216' where d15_departures.WayBillNum='$name';"|mysql -h 10.10.1.2 -u root -pexhouqze gsotldb --disable-column-names 2>/dev/null
    done
           mail -s "Waybill List" dannie@corp.dimex.ws < old_R_"$date_time".txt       #Отправка списка накладных  с маршщрутами до замены на почту данных.
          cp old_R_"$date_time".txt $dir1/TMP                                         #Копирование файла с данными в директорию TMP в которой работает скрипт form_x.sh - возвращает маршруты
                                                                                      # накладным прежний маршрут.
             }

Wait() {
       sleep 30s                                                                          #Функция ожидания
       file_exist
       }


file_exist() {                                                                             #Функция проверки существоавния файла в директории и запуска процедуры Change_route
               cd $dir2                                                                     
               a=`ls | wc -l`
               if [ $a -gt 0 ]; then
               echo "The File  Exist"
               echo $a   
              Change_route
              else
                 echo "The File Does Not Exist"
                Wait
              fi
            }
file_exist

