#!/bin/bash
##
hijau=$(tput setaf 2)
echo "${hijau}######################################"
echo "${hijau}Please run this scripts on SU"
echo "######################################"
echo "${hijau}Working....."
echo "######################################"
yum install git -y > /dev/null 2>&1
cd /opt
git clone https://github.com/Adepurnomo/Sysctl.git

mv /etc/sysctl.conf /etc/sysctl.conf-original > /dev/null 2>&1
\cp /opt/Sysctl/sysctl.conf /etc/ > /dev/null 2>&1
/bin/chmod a+x /etc/sysctl.conf
rm -rf /opt/Sysctl > /dev/null 2>&1
sleep 3
/bin/sysctl -P 
sleep 5
echo "${hijau}######################"
echo "${hijau}Checking tuned-adm"
echo "${hijau}######################"
/bin/systemctl status tuned.service
/bin/systemctl restart tuned.service
/bin/systemctl enable tuned.service
tuned-adm list 
tuned-adm active
echo "${hijau}################################"
echo "${hijau}Done"
echo "${hijau}################################"
