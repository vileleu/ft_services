FROM alpine:latest

RUN apk update \
	&& apk add influxdb \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p etc/telegraf/
COPY telegraf.conf etc/telegraf/telegraf.conf

COPY start.sh ./

EXPOSE 8086

ENTRYPOINT sh start.sh