#! /bin/sh


echo Turning force on...
sudo rm -f /etc/settings/flags/set_dns/force
sudo touch /etc/settings/flags/set_dns/rforce
