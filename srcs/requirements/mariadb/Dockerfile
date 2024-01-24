FROM alpine:3.18.0

RUN     apk --no-cache update &&\
        apk --no-cache upgrade  &&\
        apk --no-cache add vim openrc mariadb mariadb-client

RUN openrc && touch /run/openrc/softlevel
RUN sed -e '/skip-networking/s/^/#/g' -i /etc/my.cnf.d/mariadb-server.cnf
COPY tools/setup.sh .

RUN chmod 777 setup.sh
