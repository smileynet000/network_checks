#! /bin/sh


echo "Installing..."
sudo cp -f scripts/* /usr/bin
sudo chmod +x /usr/bin/basic_network_check.sh
sudo chmod +x /usr/bin/basic_internet_check.sh
sudo chmod +x /usr/bin/set_dns.sh
sudo chmod +x /usr/bin/set_dns_21-3.sh
sudo chmod +x /usr/bin/install_set_dns.sh
sudo chmod +x /usr/bin/remove_set_dns.sh
sudo chmod +x /usr/bin/set_dns-force_on.sh
sudo chmod +x /usr/bin/set_dns-force_off.sh
sudo chmod +x /usr/bin/set_dns-rforce_on.sh
sudo chmod +x /usr/bin/set_dns-rforce_off.sh
echo
