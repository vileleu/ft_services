FROM alpine:linux

RUN apk update \
	&& apk add nginx \
	&& apk add openssl \
	&& apk add openssh

COPY default.conf etc/nginx/conf.d/default.conf

RUN openssl req -x509 -nodes -newkey rsa:4096 -keyout etc/ssl/certs/services.key -out etc/ssl/certs/services.crt -days 365
RUN ssh-keygen -A