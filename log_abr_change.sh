#!/bin/bash
dir=/var/www/files
cd $dir
for file in `find . -maxdepth 1 -name '*.txt'`
do  
   newdir=`echo $file | cut -c 3- | cut -c 1-7`
   mkdir -p Archive/$newdir
   mv $file Archive/$newdir
done
