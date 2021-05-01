FROM alpine:latest

COPY start.sh ./
COPY telegraf.conf ./

RUN apk update && \
	apk -U upgrade

RUN apk add nginx libc6-compat php7 php7-fpm php7-gd php7-curl php7-mcrypt php-mysqli php7-opcache wget tar openrc && openrc reboot
RUN apk add php7-common php7-iconv php7-json php7-xml php7-imap php7-cgi fcgi php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN mkdir /run/nginx

RUN	apk add --no-cache telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/telegraf.conf

WORKDIR /var/www

RUN wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN chown 777 /var/www 

RUN mkdir -p /etc/nginx/
COPY site.conf /etc/nginx/conf.d/default.conf
COPY wp-config.php /var/www/wordpress/wp-config.php

COPY start.sh /./

EXPOSE 5050

CMD sh /start.sh
