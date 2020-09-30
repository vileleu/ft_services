FROM alpine:latest

RUN apk update \
	&& apk add wget \
	&& apk add unzip \
	&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
	&& apk del apache2 \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p var/www/ \
	mkdir -p etc/telegraf/ \
	&& wget https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip \
	&& unzip phpMyAdmin-5.0.2-all-languages.zip \
	&& mv phpMyAdmin-5.0.2-all-languages var/www/ \
	&& rm -rf phpMyAdmin-5.0.2-all-languages.zip

COPY config.inc.php var/www/phpMyAdmin-5.0.2-all-languages
COPY telegraf.conf etc/telegraf/telegraf.conf
COPY start.sh ./

EXPOSE 5000

CMD sh start.sh