/usr/sbin/php-fpm7
service nginx restart
rm ./wordpress/wp-config-sample.php
/usr/bin/telegraf --config /etc/telegraf/telegraf.conf