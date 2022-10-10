FROM alpine:3.15.6
LABEL manteiner="mviudes@student.42madrid.com"

RUN apk update && apk upgrade
RUN apk add nginx
#RUN chown -R nginx: /var/www/wordpress

COPY ./conf/nginx.conf /etc/nginx/nginx.conf

