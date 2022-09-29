FROM alpine:3.15.6
LABEL manteiner=mviudes@student.42madrid.com

RUN apk update && apk upgrade
RUN wget http://wordpress.org/latest.tar.gz &&\
	tar -xzvf latest.tar.gz && rm latest.tar.gz &&\
	apk add php8 php8-fpm php8-opcache php8-gd php8-mysqli php8-zlib php8-curl

RUN mv /wordpress /usr/share/webapps &&\
	mkdir -p /var/www/localhost/htdocs/wordpress &&\
	ln -s /usr/share/ /var/www/localhost/htdocs/wordpress
#RUN ln -s /usr/share/
#RUN sh