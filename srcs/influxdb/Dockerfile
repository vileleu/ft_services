FROM alpine:latest

COPY start.sh ./
COPY telegraf.conf ./

RUN apk update && \
	apk -U upgrade

RUN	apk add --no-cache telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/telegraf.conf

RUN apk add --no-cache influxdb

EXPOSE 8086

CMD sh start.sh