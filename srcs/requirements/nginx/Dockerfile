FROM alpine:3.15.6
LABEL manteiner="mviudes@student.42madrid.com"

RUN apk update
RUN apk add nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
#COPY ./conf/nginx.conf /
