#! /bin/sh


echo "Installing..."
sudo cp -f scripts/* /usr/bin
sudo chmod +x /usr/bin/basic_network_check.sh
sudo chmod +x /usr/bin/basic_internet_check.sh
sudo chmod +x /usr/bin/set_dns.sh
sudo chmod +x /usr/bin/install_set_dns.sh
sudo chmod +x /usr/bin/remove_set_dns.sh
echo
