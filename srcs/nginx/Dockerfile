FROM alpine:latest

RUN apk update \
	&& apk add nginx \
	&& apk add openssl \
	&& apk add openssh

RUN rm -rf etc/nginx/nginx.conf
COPY nginx.conf etc/nginx/nginx.conf
COPY index.html /var/www/localhost/htdocs/index.html
COPY sshd_config etc/ssh/sshd_config
COPY start.sh ./start.sh

#creer securite ssl et cle ssh
RUN mkdir -p var/run/nginx \
	&& mkdir -p etc/nginx/ssl \
	&& openssl req -x509 -nodes -days 365 -newkey rsa:4096 -keyout etc/nginx/ssl/services.key -out etc/nginx/ssl/services.crt -subj '/CN=FR' \
	&& ssh-keygen -A

#ports necessaire pour nginx
EXPOSE 80 443 22

CMD sh start.sh