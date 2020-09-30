mysql_install_db --user=root --datadir="/var/lib/mysql"
mysql -u root --skip-password < init_db.sql

telegraf &
mysqld --user=root --datadir="/var/lib/mysql"
