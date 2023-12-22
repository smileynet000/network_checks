#! /bin/sh

echo Performing basic network checks...
echo

echo Loopback...
ping -c 4 127.0.0.1 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo Clientrouter...
ping -c 4 192.168.2.1 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo Clientap...
ping -c 4 192.168.2.2 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo Mainap...
ping -c 4 192.168.1.2 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo Mainrouter...
ping -c 4 192.168.1.1 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo Mainrouter PFSense...
ping -c 4 192.168.0.1 > /dev/null
if [ $? -eq 1 -o $? -eq 2 ]; then
 exit 1
fi

echo
exit 0
