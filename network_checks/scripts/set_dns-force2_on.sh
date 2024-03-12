#! /bin/sh


if [ $# = 0 ]; then
 echo "$0 <resolv.conf>"
 echo
 echo "resolv.conf - Path to new resolv.conf."
else
 echo Turning force 2 on...
 sudo touch /etc/settings/flags/set_dns/force2

 sudo cp $1 /usr/bin/resolv.conf
fi
