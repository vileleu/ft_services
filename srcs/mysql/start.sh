mysql_install_db -u root --datadir=/var/lib/mysql > /dev/null
exec /usr/bin/mysqld -u root &
sleep 5
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'root';"
mysql -u root -e "CREATE DATABASE IF NOT EXISTS wp ;"
mysql -u root -e "CREATE USER 'admin'@'%' IDENTIFIED BY 'admin123' ;"
mysql -u root -e "GRANT ALL ON wp.* TO 'admin'@'%' ; FLUSH PRIVILEGES ;"

mysql -uroot wp < /wp.sql
/usr/bin/telegraf --config /etc/telegraf/telegraf.conf