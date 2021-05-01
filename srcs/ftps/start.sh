echo "admin" |  tee -a /etc/vsftpd.userlist
chown admin /home/admin
echo "vsftpd ft_services vileleu" | tee /home/admin/test.txt
/usr/bin/telegraf --config /etc/telegraf/telegraf.conf & /usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf