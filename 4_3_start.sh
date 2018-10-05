#!/bin/bash

echo "Enter your IIIT-H's username: "
read user
echo "Enter your IIIT-H's password: " 
read  -s pass

status=$(dpkg-query -W --showformat='${Status}\n' "openvpn")
if [[ "$status" != "install ok installed" ]]; then
	echo "To create vpn connection , you need to install Openvpn"
	sudo apt-get install "openvpn"
fi
echo "Downloading conf files ..."

mkdir -p VPN
wget --user $user --password $pass  https://vpn.iiit.ac.in/secure/ubuntu.ovpn --server-response -O VPN/ubuntu.ovpn &> VPN/response
code=$(grep "HTTP/" VPN/response | awk 'NR>1 { print $2}')
if [[ "$code" == "401" ]]; then
	echo "Authorization Failed : Invalid username password "	
elif [[ "$code" == "200" ]]; then
	echo "Creating vpn connection.."
	sudo openvpn VPN/ubuntu.ovpn 1> VPN/response
	# echo "VPN Started"
fi



