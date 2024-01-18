#!/bin/sh

chown -R mysql: /var/lib/mysql
chmod 777 /var/lib/mysql 

/etc/init.d/mariadb setup
/etc/init.d/mariadb restart

sleep 3

mysql -e "CREATE USER IF NOT EXISTS $MYSQL_USER@'localhost' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE_NAME.* TO $MYSQL_USER@'localhost' WITH GRANT OPTION;"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%';"
mysql -e "FLUSH PRIVILEGES;"
mysql -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE_NAME;"

#mysql -uroot -e "DROP USER 'root'@'localhost';"
#mysql -uroot -e "CREATE USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';"
#mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"
#exec mysqld_safe --console
