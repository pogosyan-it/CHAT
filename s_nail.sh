#!/bin/bash

s_nail=$(dpkg --get-selections | grep s-nail | awk '{print $2}')
if [[ $s_nail == "install" ]]; then
   echo "GOOD"
else
   dpkg -i /home/it/soft/s-nail_14.8.6-1_amd64.deb
   echo "MTA-client installed" | mail -s 'S-NAIL-IP-10' it@int.dmcorp.ru
fi
