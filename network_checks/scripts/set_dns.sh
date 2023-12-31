#! /bin/sh


echo Testing network...
logger Testing network...
echo Checking if force...
logger Checking if force...
if [ -f /etc/settings/flags/set_dns/force ]; then
 echo Emulate success...
 logger Emulate success...

 sudo rm /etc/settings/flags/set_dns/fail
 echo Fix resolv.conf...
 sudo systemctl disable systemd-resolved
 sudo systemctl stop systemd-resolved

 sudo rm -f /etc/resolv.conf
 sudo cp -f /usr/bin/stub-resolv.conf /etc/resolv.conf
elif [ -f /etc/settings/flags/set_dns/rforce ]; then
 echo Emulate fail...
 logger Emulate fail...

  sudo rm /etc/settings/flags/set_dns/success
  sudo rm -f /etc/resolv.conf
  sudo cp -f /usr/bin/stub-resolv2.conf /etc/resolv.conf
  sudo systemctl enable systemd-resolved
  sudo systemctl start systemd-resolved
else
 echo Testing...
 logger Testing...


 sh /usr/bin/basic_network_check.sh > /dev/null
 if [ $? -eq 1 ]; then
  echo Fail...
  logger Fail...

  if [ -f /etc/settings/flags/set_dns/fail ]; then
   exit 1
  else
   sudo touch /etc/settings/flags/set_dns/fail
  fi

  sudo rm /etc/settings/flags/set_dns/success
  sudo rm -f /etc/resolv.conf
  sudo cp -f /usr/bin/stub-resolv2.conf /etc/resolv.conf
  sudo systemctl enable systemd-resolved
  sudo systemctl start systemd-resolved
 
  exit 1
 fi


 echo Success...
 logger Success...

 if [ -f /etc/settings/flags/set_dns/success ]; then
  sh /usr/bin/basic_internet_check.sh
  if [ $? -eq 1 ]; then
   echo No Internet...
   logger No Internet...
  else
   echo Internet...
   logger Internet...
  fi

  exit 0
 else
  sudo touch /etc/settings/flags/set_dns/success
 fi

 sudo rm /etc/settings/flags/set_dns/fail
 echo Fix resolv.conf...
 sudo systemctl disable systemd-resolved
 sudo systemctl stop systemd-resolved

 sudo rm -f /etc/resolv.conf
 sudo cp -f /usr/bin/stub-resolv.conf /etc/resolv.conf

 sh /usr/bin/basic_internet_check.sh
 if [ $? -eq 1 ]; then
  echo No Internet...
  logger No Internet...
 else
  echo Internet...
  logger Internet...
 fi

 exit 0
fi
