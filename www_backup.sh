  #!/bin/sh
  
  #####

        curdate="`date \+\%Y_\%m_\%d_\%H_\%M`"
        mkdir -p /media/backup/PHP_scripts
        backupdir="/media/backup/PHP_scripts/$curdate"
        fromdir1="/var/www"
        todir1="$backupdir"
        mkdir $todir1
        chmod 0777 $todir1
        chmod 0777 $backupdir
        cp $fromdir1 $todir1 -r -p
        cd /var/www
        sftp=10.10.1.6
        uftp=it
        pftp=2me32jvppn
        dest_lan="/home/it/store2/PHP_scripts"
        source_lan="/media/backup/PHP_scripts"
        ncftpput -R -u "$uftp" -p "$pftp" $sftp  $dest_lan $source_lan/.
      

