FROM alpine:3.19.0
LABEL manteiner="mviudes@student.42madrid.com"

RUN		apk --no-cache update &&\
		apk --no-cache upgrade &&\
		apk add --no-cache gettext nginx=1.24.0-r14 openssl

COPY ./conf/nginx.conf /etc/nginx/nginx.conf
#/tmp/nginx.conf.template
#RUN envsubst < /tmp/nginx.conf.template > /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress && \
	chown -R nginx:nginx /var/www/wordpress

RUN mkdir /etc/nginx/ssl \
		&& chmod 750 /etc/nginx/ssl \
		&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
			-out /etc/nginx/ssl/example.crt \
			-keyout /etc/nginx/ssl/example.key -subj "/C=ES/ST=Madrid/L=Madrid/O=42 School/OU=mviudes/CN=mviudes.42.fr"
ENTRYPOINT ["nginx", "-g", "daemon off;"]