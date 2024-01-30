#! /bin/bash


echo Installing Set DNS...
if [ -f /etc/settings/flags/versions/linux_mint-21.3 ]; then
 (sudo crontab -u root -l 2> /dev/null ; echo "*/5 * * * * /usr/bin/set_dns_21-3.sh") | sudo crontab -u root -
 echo
else
 (sudo crontab -u root -l 2> /dev/null ; echo "*/5 * * * * /usr/bin/set_dns.sh") | sudo crontab -u root -
 echo
fi
