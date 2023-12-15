FROM alpine:3.19.0
LABEL manteiner=mviudes@student.42madrid.com

COPY ./tools/init.sh /
RUN chmod +x init.sh

RUN apk update && apk upgrade

RUN apk add --no-cache \
        php-fpm \
        php-phar \
        php-mysqli \
        mariadb-client \
        php-mbstring \
        php-session


COPY ./conf/www.conf /etc/php82/php-fpm.d/www.conf

#        gettext \
#        php8 php8-fpm php8-opcache php8-gd php8-mysqli php8-zlib php8-curl \
#        mariadb-client

#RUN sed -e '/skip-networking/s/^/#/g' -i /etc/my.cnf.d/mariadb-server.cnf
#RUN sed -e '/listen =/s/127.0.0.1/0.0.0.0/g' -i /etc/php8/php-fpm.d/www.conf

RUN mkdir -p /var/www/wordpress && \
    chmod -R 755 /var/www/wordpress

RUN wget https://wordpress.org/wordpress-6.4.tar.gz && \
    tar -xzvf wordpress-6.4.tar.gz -C /var/www/ && \
	rm wordpress-6.4.tar.gz

############
#Recommend PHP 7.4 or greater and MySQL version 5.7 or MariaDB version 10.4 or greater.
############


#&& \
#	mv /wordpress /var/www/localhost/ && \
#	mv /tmp/wp-config.php /usr/share/webapps/wordpress/ && \
#	rm -rf /var/www/localhost/htdocs/ && \
#	ln -s /usr/share/webapps/wordpress /var/www/localhost/htdocs


#ENTRYPOINT [ "p", "--nodaemonize" ]
#CMD php-fpm81 --nodaemonize

