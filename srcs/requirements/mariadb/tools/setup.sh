#!/bin/sh

rc-service mariadb restart
sleep 3

mysql -e "CREATE DATABASE $DB_NAME;"
mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PASSWD';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$DB_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"