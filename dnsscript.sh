Ansible_java_centos_ip=$(cat /home/centos/workspace/praveen/Ansible_java_centos_ip)
RAnsible_java_centos_ip=$(cat /home/centos/workspace/praveen/Ansible_java_centos_ip | perl -lne 'print join ".", reverse split/\./;')
Ansible_java_ubuntu_ip=$(cat /home/centos/workspace/praveen/Ansible_java_ubuntu_ip)
RAnsible_java_ubuntu_ip=$(cat /home/centos/workspace/praveen/Ansible_java_ubuntu_ip | perl -lne 'print join ".", reverse split/\./;')
Ansible_java_windows12_ip=$(cat /home/centos/workspace/praveen/Ansible_java_windows12_ip)
RAnsible_java_windows12_ip=$(cat /home/centos/workspace/praveen/Ansible_java_windows12_ip | perl -lne 'print join ".", reverse split/\./;')
echo 'anible_java_chostname1=$(cat /var/named/forward.zone | grep ansiblecentosjava.zippyops.com)' > /home/dns.sh
echo 'anible_java_chostname2=$(cat /var/named/192.168.2.reverse.zone | grep ansiblecentosjava.zippyops.com)' >> /home/dns.sh
echo 'anible_java_uhostname1=$(cat /var/named/forward.zone | grep ansibleubuntujava.zippyops.com)' >> /home/dns.sh
echo 'anible_java_uhostname2=$(cat /var/named/192.168.2.reverse.zone | grep ansibleubuntujava.zippyops.com)' >> /home/dns.sh
echo 'anible_java_whostname1=$(cat /var/named/forward.zone | grep ansiblewindowsjava.zippyops.com)' >> /home/dns.sh
echo 'anible_java_whostname2=$(cat /var/named/192.168.2.reverse.zone | grep ansiblewindowsjava.zippyops.com)' >> /home/dns.sh
echo 'sed -i "/$anible_java_chostname1/d" /var/named/forward.zone' >> /home/dns.sh
echo 'sed -i "/$anible_java_chostname2/d" /var/named/192.168.2.reverse.zone' >> /home/dns.sh
echo 'sed -i "/$anible_java_uhostname1/d" /var/named/forward.zone' >> /home/dns.sh
echo 'sed -i "/$anible_java_uhostname2/d" /var/named/192.168.2.reverse.zone' >> /home/dns.sh
echo 'sed -i "/$anible_java_whostname1/d" /var/named/forward.zone' >> /home/dns.sh
echo 'sed -i "/$anible_java_whostname2/d" /var/named/192.168.2.reverse.zone' >> /home/dns.sh
echo "sed -i '/^$/d' /var/named/forward.zone" >> /home/dns.sh
echo "sed -i '/^$/d' /var/named/192.168.2.reverse.zone" >> /home/dns.sh
echo "echo ansiblecentosjava.zippyops.com. IN A $Ansible_java_centos_ip >> /var/named/forward.zone" >> /home/dns.sh
echo "echo $RAnsible_java_centos_ip.in-addr.arpa. IN PTR ansiblecentosjava.zippyops.com. >> /var/named/192.168.2.reverse.zone" >> /home/dns.sh
echo "echo ansibleubuntujava.zippyops.com. IN A $Ansible_java_ubuntu_ip >> /var/named/forward.zone" >> /home/dns.sh
echo "echo $RAnsible_java_ubuntu_ip.in-addr.arpa. IN PTR ansibleubuntujava.zippyops.com. >> /var/named/192.168.2.reverse.zone" >> /home/dns.sh
echo "echo ansiblewindowsjava.zippyops.com. IN A $Ansible_java_windows12_ip >> /var/named/forward.zone" >> /home/dns.sh
echo "echo $RAnsible_java_windows12_ip.in-addr.arpa. IN PTR ansiblewindowsjava.zippyops.com. >> /var/named/192.168.2.reverse.zone" >> /home/dns.sh
echo "service named restart" >> /home/dns.sh
echo "rm -rf /home/dns.sh" >> /home/dns.sh
chmod 755 /home/dns.sh
sshpass -p 'zippyops' scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no /home/dns.sh root@192.168.0.223:/home/dns.sh
