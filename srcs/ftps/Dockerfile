FROM alpine:latest

COPY start.sh ./
COPY telegraf.conf ./

RUN apk update && \
	apk -U upgrade

RUN apk add vsftpd openssl

RUN	apk add --no-cache telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/telegraf.conf

RUN adduser -D "admin" && \
	echo "admin:admin" | chpasswd && \
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout etc/ssl/private/vsftpd.key -out etc/ssl/certs/vsftpd.crt -subj '/CN=FR'

COPY vsftpd.conf etc/vsftpd/vsftpd.conf
COPY start.sh ./

RUN set -ex && apk --no-cache add sudo

EXPOSE 21 30000

CMD sudo sh start.sh