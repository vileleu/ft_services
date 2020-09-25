FROM alpine:latest

RUN apk update \
	&& apk add mariadb mariadb-client

COPY mariadb-server.cnf /etc/my.cnf.d/mariadb-server.cnf