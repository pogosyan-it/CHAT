#!bin/bash
dir="/media/backup"
date_NOW="`date +%s`"
#temp_dir="/home/it/temp"
#echo $date_NOW 

cd $dir
      for dir1 in `ls -l | awk '{print $9}'`
    do
   ATime=`stat -c%Y $dir1`
   let "delta = $date_NOW - $ATime";
   echo $delta
if [ $delta -gt  614800 ]; then
   rm -r $dir1 
else
   echo "Nothing to do"
fi
    done
