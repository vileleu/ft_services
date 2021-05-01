FROM alpine:latest

COPY telegraf.conf ./
COPY start.sh ./

RUN apk update && \
	apk -U upgrade

RUN apk add libc6-compat php7-fpm php7-common php7-iconv php7-json php7-gd php7-curl php7-xml php7-mysqli php7-imap php7-cgi fcgi \
    php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom nginx phpmyadmin wget tar openrc && openrc reboot

RUN	apk add --no-cache telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/telegraf.conf

RUN mkdir /run/nginx
RUN mkdir -p /usr/share/webapps/

WORKDIR /usr/share/webapps/

RUN wget https://files.phpmyadmin.net/phpMyAdmin/5.1.0/phpMyAdmin-5.1.0-english.tar.gz
RUN tar zxvf phpMyAdmin-5.1.0-english.tar.gz 
RUN rm phpMyAdmin-5.1.0-english.tar.gz
RUN mv phpMyAdmin-5.1.0-english phpmyadmin
RUN chmod -R 777 /usr/share/webapps/phpmyadmin

COPY config.inc.php /etc/phpmyadmin/config.inc.php
COPY site.conf /etc/nginx/conf.d/default.conf

EXPOSE 5000

CMD sh /start.sh