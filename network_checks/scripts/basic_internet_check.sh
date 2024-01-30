#! /bin/sh

check() {
    echo "$2"...
    ping -c 4 "$1" > /dev/null
    if [ $? -eq 1 -o $? -eq 2 ]; then
        exit 1
    fi
}

echo Performing basic Internet checks...
echo

check 192.168.1.11 'Network DNS Server'
check 192.168.2.1 'Clientrouter'
check 208.67.222.222 'OpenDNS Server'
check 208.67.220.220 'OpenDNS Server 2'
check 8.8.8.8 'Google DNS 1'
check 8.8.4.4 'Google DNS 2'
check www.spectrum.com 'Spectrum'
check www.google.com 'Google'

echo
exit 0
