#! /bin/sh

check() {
    echo "$2"...
    ping -c 4 "$1" > /dev/null
    if [ $? -eq 1 -o $? -eq 2 ]; then
        exit 1
    fi
}


echo Performing basic network checks...
echo


check 127.0.0.1 'Loopback'
check 192.168.2.1 'Clientrouter'
check 192.168.2.2 'Clientap'
check 192.168.1.2 'Mainap'
check 192.168.1.1 'Mainrouter'
check 192.168.0.1 'Mainrouter PFSense'

echo
exit 0
