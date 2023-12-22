#! /bin/bash


echo Installing Set DNS...
(sudo crontab -u root -l 2> /dev/null ; echo "*/5 * * * * /usr/bin/set_dns.sh") | sudo crontab -u root -
echo
