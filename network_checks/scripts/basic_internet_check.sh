#! /bin/sh

echo Performing basic Internet checks...
echo

echo Network DNS server...
ping -c 4 192.168.1.11 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo Clientrouter...
ping -c 4 192.168.2.1 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo OpenDNS server 1...
ping -c 4 208.67.222.222 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo OpenDNS server 2...
ping -c 4 208.67.220.220 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo Google DNS 1...
ping -c 4 8.8.8.8 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo Google DNS 2...
ping -c 4 8.8.4.4 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi


echo Spectrum...
ping -c 4 www.spectrum.com > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo Google...
ping -c 4 www.google.com > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo
exit 0
