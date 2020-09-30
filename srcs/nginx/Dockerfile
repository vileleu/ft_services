FROM alpine:latest

RUN apk update \
	&& apk add nginx \
	&& apk add openssl \
	&& apk add openssh \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN rm -rf etc/nginx/conf.d/nginx.conf

COPY nginx.conf etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/index.html

RUN rm -rf etc/ssh/sshd_config
COPY sshd_config etc/ssh/sshd_config

RUN mkdir -p etc/telegraf
COPY telegraf.conf etc/telegraf/telegraf.conf

COPY start.sh ./start.sh

#creer securite ssl et cle ssh
RUN mkdir -p run/nginx \
	&& mkdir -p etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout etc/nginx/ssl/services.key -out etc/nginx/ssl/services.crt -subj '/CN=FR' \
	&& ssh-keygen -A

#ports necessaire pour nginx
EXPOSE 80 443 22

CMD sh start.sh