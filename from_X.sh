#!bin/bash

dir1="/home/it/NAX"
dir2="/var/www/from_X"
curdate="`date \+\%Y_\%m_\%d`"
date_time="`date \+\%Y_\%m_\%d_\%H_\%M`"

mkdir -p $dir1/$curdate 
mkdir -p $dir1/$curdate/from_X
 cat from_X*.txt
                 find $dir2 -name 'from_X*.txt' | xargs mv -t $dir1/$curdate/from_X
                 cd $dir1/$curdate/from_X
      sed -i -e '$d' from_X_*.txt
      cat from_X_*.txt >> from_Y_"$date_time".txt
      rm from_X_*.txt
      cat from_Y_*.txt | tr -d '\r' >> from_X_"$date_time".txt
      rm from_Y_*.txt
      cd $dir1/TMP/
      cat old_*.txt >> new_"$date_time".txt
      rm old_*.txt
      mv new_"$date_time".txt old_"$date_time".txt  

    cd $dir1/$curdate/from_X
    for waybill in `cat from_X_*.txt`; do
    echo $waybill >> /home/it/11.txt
    route=`grep $waybill $dir1/TMP/old_*.txt | awk '{print $3}'`
    echo  "Update d15_departures SET d15_departures.R_RouteID='$route' where d15_departures.WayBillNum='$waybill';"|mysql -h 10.10.1.2 -u root -pexhouqze gsotldb --disable-column-names 2>/dev/null
     
    done
    mv from_X_*.txt alredy_used_"$date_time".txt
    rm $dir1/TMP/old_*.txt
     
