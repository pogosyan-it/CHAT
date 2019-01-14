#!/bin/sh

/etc/init.d/openfire stop
curdate="`date \+\%Y_\%m_\%d_\%H_\%M`"
backupdir="/media/backup/$curdate"
mkdir -p /media/backup
mkdir $backupdir
#touch $backupdir/openfire.sql
mysqldump -u root -pexhouqze openfire > $backupdir/openfire.sql
/etc/init.d/openfire start
file="/media/backup/$curdate/openfire.sql"
if [ -f $file ] 
then
echo "Openfire database backup is done" | mail -s "chat" it@corp.dimex.ws
else
echo "Backup fail" | mail -s "chat" it@corp.dimex.ws
exit
fi



