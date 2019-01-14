#!bin/bash

cd /var/www/txt
a=`ls | wc -l`
               if [ $a -gt 0 ]; then
               echo "The File  Exist"
              else
                 echo "The File Does Not Exist"
              fi

