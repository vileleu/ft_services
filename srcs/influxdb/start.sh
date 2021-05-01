/usr/bin/telegraf --config /etc/telegraf/telegraf.conf & /usr/sbin/influxd

influx -execute "CREATE DATABASE metrics"
influx -execute "CREATE USER admin WITH PASSWORD 'admin123'"
influx -execute "GRANT ALL ON metrics TO admin"
influx -execute "CREATE RETENTION POLICY auto_delete ON metrics DURATION 1d REPLICATION 1 DEFAULT"