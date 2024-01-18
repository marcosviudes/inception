# FROM alpine:3.19.0
# LABEL manteiner="mviudes@student.42madrid.com"

# RUN apk update && apk upgrade
# RUN apk add --no-cache openrc mariadb mariadb-client

# COPY tools/mariadb.sh ./mariadb.sh
# RUN openrc && touch /run/openrc/softlevel
# RUN chmod +x ./mariadb.sh

# #ENTRYPOINT ["sh", "./mariadb.sh"]
# CMD ./setup.sh && mysqld_safe

FROM alpine:3.19.0

RUN     apk --no-cache update &&\
        apk --no-cache upgrade  &&\
        apk --no-cache add vim openrc mariadb mariadb-client

RUN openrc && touch /run/openrc/softlevel
#RUN mysql_install_db 
RUN sed -e '/skip-networking/s/^/#/g' -i /etc/my.cnf.d/mariadb-server.cnf

#COPY my.cnf /etc/mysql/my.cnf
#COPY my.cnf /etc/my.cnf

COPY tools/setup.sh .

RUN chmod 777 setup.sh

#CMD ./setup.sh 
#CMD ./setup.sh #&& mysqld_safe
#ENTRYPOINT ["./setup.sh"]