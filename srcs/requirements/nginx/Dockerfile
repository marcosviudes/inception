FROM alpine:3.19.0
LABEL manteiner="mviudes@student.42madrid.com"

RUN		apk --no-cache update &&\
		apk --no-cache upgrade &&\
		apk add --no-cache gettext nginx=1.24.0-r14

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
#/tmp/nginx.conf.template
#RUN envsubst < /tmp/nginx.conf.template > /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress && \
	chown -R nginx:nginx /var/www/wordpress

ENTRYPOINT ["nginx", "-g", "daemon off;"]