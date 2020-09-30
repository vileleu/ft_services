FROM alpine:latest

RUN apk update \
	&& apk add vsftpd \
	&& apk add openssl \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p etc/nginx/ssl \
	&& mkdir -p etc/telegraf \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout etc/ssl/certs/vsftpd.key -out etc/ssl/certs/vsftpd.crt -subj '/CN=FR'

COPY vsftpd.conf etc/vsftpd/vsftpd.conf
COPY telegraf.conf etc/telegraf/telegraf.conf
COPY start.sh ./

EXPOSE 21

CMD sh start.sh