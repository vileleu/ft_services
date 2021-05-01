FROM alpine:latest

COPY start.sh ./
COPY dashboard.json ./
COPY dashboard.yaml ./
COPY datasource.yaml ./
COPY telegraf.conf ./

RUN apk update && \
	apk -U upgrade

RUN	apk add --no-cache telegraf && \
	mkdir -p /etc/telegraf && \
	mv telegraf.conf /etc/telegraf/telegraf.conf

RUN apk add --no-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ grafana && \
	mkdir -p /var/lib/grafana/dashboards && \
	mv datasource.yaml /usr/share/grafana/conf/provisioning/datasources/ && \
	mv dashboard.yaml /usr/share/grafana/conf/provisioning/dashboards/ && \
	mv dashboard.json /var/lib/grafana/dashboards/

EXPOSE 3000

RUN chmod +x ./start.sh

CMD ./start.sh
