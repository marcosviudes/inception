FROM alpine:3.15.6
LABEL manteiner="mviudes@student.42madrid.com"

RUN apk update && apk upgrade
RUN apk add --no-cache gettext nginx

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
	#/tmp/nginx.conf.template
#RUN envsubst < /tmp/nginx.conf.template > /etc/nginx/nginx.conf
RUN mkdir -p /var/www/wordpress && \
	chown -R nginx: /var/www/wordpress
