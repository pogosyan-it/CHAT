#!/bin/bash

dir="/home/it/scripts"

for i in `cat $dir/strits.txt | awk '{print $2}' | uniq`
do
   COUNT=`cat $dir/strits.txt | grep $i | awk '{print $3}' | uniq | wc -l`
 if [[ $COUNT -gt 1 ]]; then
   for j in `cat $dir/strits.txt | grep $i | awk '{print $3}'|uniq`
      do
            echo "$i    $j" >> $dir/result.txt
      done
  fi
done

