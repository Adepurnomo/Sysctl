#!/bin/bash
##
hijau=$(tput setaf 2)
echo "${hijau}######################################"
echo "${hijau}Please run this scripts on SU"
echo "######################################"
echo "${hijau}Working....."
echo "######################################"
curl -o /opt/sysctl.conf https://raw.githubusercontent.com/Adepurnomo/Sysctl/master/sysctl.conf
chmod a+x /opt/sysctl.conf
mv /etc/sysctl.conf /etc/sysctl.conf-original > /dev/null 2>&1
\cp /opt/Sysctl/sysctl.conf /etc/ > /dev/null 2>&1
/bin/chmod a+x /etc/sysctl.conf
rm -rf /opt/Sysctl > /dev/null 2>&1
sleep 3
sysctl -p 
sleep 3
echo "${hijau}######################"
echo "${hijau}Checking tuned-adm"
echo "${hijau}######################"
/bin/systemctl status tuned.service
/bin/systemctl restart tuned.service
/bin/systemctl enable tuned.service
tuned-adm list 
tuned-adm active
echo "${hijau}################################"
echo "${hijau}Done, Please restart your server"
echo "${hijau}################################"
