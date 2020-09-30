FROM alpine:latest

RUN apk update \
	&& apk add wget

RUN wget https://dl.grafana.com/oss/release/grafana-6.7.2.linux-amd64.tar.gz \
	&& tar -zxvf grafana-6.7.2.linux-amd64.tar.gz \
	&& apk add --repository http://dl-cdn.alpinelinux.org/alpine/edge/main libc6-compat \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p etc/telegraf/

COPY telegraf.conf etc/telegraf/telegraf.conf
COPY grafana.db /grafana-6.7.2/data/
COPY start.sh ./

EXPOSE 3000

CMD sh start.sh