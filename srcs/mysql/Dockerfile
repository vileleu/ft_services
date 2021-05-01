FROM alpine:latest

COPY start.sh ./
COPY telegraf.conf ./

RUN apk update && \
	apk -U upgrade

RUN apk --no-cache add mysql mysql-client libc6-compat openrc && openrc reboot

RUN	apk add --no-cache telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/telegraf.conf

COPY my.cnf /etc/my.cnf

RUN mkdir -p /var/lib/mysql /run/mysqld/
RUN chown -R mysql:root /run/mysqld/

COPY prob.sh ./
COPY wp.sql ./

EXPOSE 3306 

CMD sh start.sh