FROM alpine:3.15.6
LABEL manteiner="mviudes@student.42madrid.com"

RUN apk update && apk upgrade
RUN apk add --no-cache openrc mariadb mariadb-client


#ENTRYPOINT nginx -g 'daemon off;'