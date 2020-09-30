FROM alpine:latest

RUN apk update \
	&& apk add wget \
	&& apk add unzip \
	&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
	&& apk del apache2 \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir var/www/ \
	&& mkdir -p etc/telegraf \
	&& wget https://wordpress.org/latest.zip \
	&& unzip latest.zip -d var/www/ \
	&& rm -rf latest.zip wordpress

COPY start.sh ./
COPY wp-config.php ./var/www/wordpress/
COPY telegraf.conf etc/telegraf/telegraf.conf

RUN chmod 755 ./start.sh

EXPOSE 5050

CMD sh start.sh
