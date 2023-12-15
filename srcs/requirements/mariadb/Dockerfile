# FROM alpine:3.19.0
# LABEL manteiner="mviudes@student.42madrid.com"

# RUN apk update && apk upgrade
# RUN apk add --no-cache openrc mariadb mariadb-client

# COPY tools/mariadb.sh ./mariadb.sh
# RUN openrc && touch /run/openrc/softlevel
# RUN chmod +x ./mariadb.sh

# #ENTRYPOINT ["sh", "./mariadb.sh"]
# CMD ./setup.sh && mysqld_safe

FROM alpine:3.13

RUN apk add mariadb mariadb-client mariadb-common openrc

RUN openrc && touch /run/openrc/softlevel && /etc/init.d/mariadb setup && /etc/init.d/mariadb start

RUN sed -e '/skip-networking/s/^/#/g' -i /etc/my.cnf.d/mariadb-server.cnf

COPY tools/setup.sh .

RUN chmod -R 777 setup.sh

CMD ./setup.sh && mysqld_safe
