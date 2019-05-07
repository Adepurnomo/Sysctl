#!/bin/bash
##
hijau=$(tput setaf 2)
echo "${hijau}######################################"
echo "${hijau}Please run this scripts on SU"
echo "######################################"

yum install git -y > /dev/null 2>&1
cd /opt
git clone -b https://github.com/Adepurnomo/Sysctl.git

mv /etc/sysctl.conf /etc/sysctl.conf-original > /dev/null 2>&1
\cp /opt/sysctl/sysctl.conf /etc/ > /dev/null 2>&1
/bin/chmod a+x /etc/sysctl.conf

echo "${hijau}######################"
echo "${hijau}Checking tuned-adm"
echo "${hijau}######################"
/bin/systemctl status tuned.service
/bin/systemctl restart tuned.service
/bin/systemctl enable tuned.service
/bin/tuned-adm list 
/bin/tuned-adm active
echo "${hijau}################################"
echo "${hijau}Done, Please restrat your server"
echo "${hijau}################################"