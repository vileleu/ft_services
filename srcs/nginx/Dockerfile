FROM alpine:latest

RUN apk update \
	&& apk add nginx \
	&& apk add openssl \
	&& apk add openssh

COPY default.conf etc/nginx/conf.d/default.conf
COPY index.html /var/www/localhost/htdocs/index.html

#creer securite ssl et cle ssh
RUN openssl req -x509 -nodes -days 365 -newkey -subj '/CN=FR' rsa:4096 -keyout etc/ssl/certs/nginx_services.key -out etc/ssl/certs/nginx_services.crt
RUN ssh-keygen -A

#creer un nouvel user
RUN start.sh

#ports necessaire pour nginx
EXPOSE 80 443 22