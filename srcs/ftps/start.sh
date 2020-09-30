echo -e "admin\nadmin" | adduser -h /ftp/user -s /sbin/nologin -u 1000 admin

mkdir -p /ftp/user
chown admin:admin /ftp/user

telegraf &
vsftpd -opasv_min_port=21 -opasv_max_port=21 -opasv_address=$IP /etc/vsftpd/vsftpd.conf