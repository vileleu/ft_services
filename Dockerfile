FROM alpine:latest

RUN apk update \
	&& apk add nginx

COPY srcs/nginx/nginx.yaml ./

EXPOSE 80 443