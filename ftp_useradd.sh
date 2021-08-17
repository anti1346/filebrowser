#!/bin/bash

FBPW=`cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1`

useradd -m -d /ftp-root/$1 -s /sbin/nologin $1
echo '1234' | passwd --stdin $1
rm -rf /ftp-root/$1/.*
echo $1 >> /etc/vsftpd/chroot_list
sleep 1

ps -ef | grep -v grep | grep filebrowser | awk {'print $2'} | xargs kill
sleep 2

#filebrowser users add $1 $FBPW --perm.delete --perm.download --perm.execute --scope /ftp-root/$1 -c .filebrowser.json -d filebrowser.db
filebrowser users add $1 $FBPW --scope /ftp-root/$1 -c .filebrowser.json -d filebrowser.db
filebrowser users update $1 --perm.create=false --perm.modify=false --perm.rename=false --perm.share=false --scope /ftp-root/$1 -c .filebrowser.json -d filebrowser.db
sleep 1

./filebweb.sh

clear
echo -e "\n\n\n\n\n\n\n\n\n\n"
echo "## FTP Account INFO##"
echo "USER ID : " $1
echo "Initial Password : 1234"
echo -e "\n"
echo "## FILE BROWSER Account INFO##"
echo "USER ID : " $1
echo "Initial Password : " $FBPW
echo -e "\n\n\n\n\n\n\n\n\n\n"
