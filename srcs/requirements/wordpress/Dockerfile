FROM alpine:3.15.6
LABEL manteiner=mviudes@student.42madrid.com

RUN apk update && apk upgrade

RUN apk add --no-cache \
        openrc \
        gettext \
        php8 php8-fpm php8-opcache php8-gd php8-mysqli php8-zlib php8-curl \
        mariadb-client




