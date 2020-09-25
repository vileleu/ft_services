FROM alpine:latest

RUN apk update \
	&& apk add wget \
	&& apk add unzip \
	&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session \
	&& apk del apache2

RUN mkdir var/www/ \
	&& wget https://wordpress.org/latest.zip \
	&& unzip latest.zip \
	&& mv wordpress/* var/www/ \
	&& rm -rf latest.zip wordpress

COPY wp-config.php ./var/www/

EXPOSE 5050

CMD sh start.sh
