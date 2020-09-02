#!/bin/bash
#Author:Aruna Bakarr Sesay
#Date:May.30.2020
#Discription:Check the system and install the right package

echo "\n**********Script to install firewalll***********\n" FirewallConfiguration.sh-$( date +%F )


echo "\n***********************Installation begine**********************\n" FirewallConfiguration.sh-$( date +%F )

echo -e "\n Firewall Configuration\n" >> FirewallConfiguration.sh-$( date +%F )

cat /etc/os-release | awk -F "^ID=" '{print  $2}'>> FirewallConfiguration.sh-$( date +%F )

if
  [ $? -eq 0 ]

then
   echo  "This server is centos" >> FirewallConfiguration.sh-$( date +%F )
yum update -y
yum install httpd -y  >> FirewallConfiguration.sh-$( date +%F )
systemctl start httpd  >> FirewallConfiguration.sh-$( date +%F )
systemctl enable httpd  >> FirewallConfiguration.sh-$( date +%F )
firewall-cmd --permanent --add-port=80/tcp  >> FirewallConfiguration.sh-$( date +%F )
firewall-cmd --reload  >> FirewallConfiguration.sh-$( date +%F )
else
  echo "This server is ubuntu">> FirewallConfiguration.sh-$( date +%F )

apt update -y
apt install apache2 -y  >> FirewallConfiguration.sh-$( date +%F )
systemctl start apache2  >> FirewallConfiguration.sh-$( date +%F )
ufw allow 80/tcp  >> FirewallConfiguration.sh-$( date +%F )
ufw --reload  >> FirewallConfiguration.sh-$( date +%F )
fi

