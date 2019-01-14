#!/bin/bash

wait () {
sleep  1m
mail_send
}

mail_send () {
#let y=$(date +%H)*60+$(date +%M)
let y=$(date +%H)
if [[ $((y % 3)) = 0 ]]
    then 
echo "YES"
      wait 
else 
     echo "$y --> NO"
     wait 
fi
}


mail_send 
