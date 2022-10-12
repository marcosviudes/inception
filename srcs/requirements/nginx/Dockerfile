FROM alpine:3.15.6
LABEL manteiner="mviudes@student.42madrid.com"

RUN apk update && apk upgrade
RUN apk add gettext nginx

COPY ./conf/nginx.conf /tmp/nginx.conf.template
RUN envsubst < /tmp/nginx.conf.template > /etc/nginx/nginx.conf
RUN chown -R nginx: /var/www/wordpress

