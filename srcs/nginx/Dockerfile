FROM alpine:latest

COPY start.sh ./
COPY telegraf.conf ./

RUN apk update && \
	apk -U upgrade

RUN apk add --no-cache nginx libc6-compat openssl curl ca-certificates openrc openssh && openrc reboot

RUN	apk add --no-cache telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/telegraf.conf

RUN mkdir -p run/nginx/ && \
	mkdir -p etc/ssl/private && \
	mkdir -p etc/ssl/certs && \
	openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt -subj '/CN=FR'

COPY index.html /var/www/index.html
	
RUN	adduser -D "admin" && \
	echo "admin:admin123" | chpasswd && \
	ssh-keygen -A

RUN	mkdir -p /etc/nginx/
COPY site.conf /etc/nginx/conf.d/default.conf

EXPOSE 80 443 22

CMD sh start.sh