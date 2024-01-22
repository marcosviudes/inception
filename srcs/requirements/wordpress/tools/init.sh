#!/bin/sh

#sleep 15

until nc -z -v -w30 $MYSQL_DATABASE_HOST 3306
do
  echo "Esperando a que la base de datos esté disponible..."
  sleep 5
done


#chown -R www-data:www-data /var/www/wordpress
#chmod -R 755 /var/www/wordpress

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

if [ ! -e /var/www/wordpress/wp-config.php ]; then
  sed -e "s/database_name_here/$MYSQL_DATABASE_NAME/" \
      -e "s/username_here/$MYSQL_USER/" \
      -e "s/password_here/$MYSQL_PASSWORD/" \
      -e "s/localhost/$MYSQL_DATABASE_HOST/" \
      /var/www/wordpress/wp-config-sample.php > /var/www/wordpress/wp-config.php

  curl -s https://api.wordpress.org/secret-key/1.1/salt/ >> /var/www/wordpress/wp-config.php
fi

if [ ! -e /var/www/wordpress/user_created.txt ]; then
  #wp user create $WP_ADMIN $WP_ADMIN_MAIL --role=administrator --user_pass=$WP_ADMIN_PASSWORD --path=var/www/wordpress
  touch /var/www/wordpress/user_created.txt
fi

if [ ! -e /var/www/wordpress/home_page_created.txt ]; then
  #wp post create --post_type=page --post_title='Inception' --post_status=publish --path=var/www/wordpress
  wp core install  --url=$DOMAIN_NAME --title=Inception --admin_user=$WP_ADMIN --admin_password=$WP_ADMIN_PASSWORD --admin_email="$WP_ADMIN_MAIL" --path=/var/www/wordpress
  wp user create $WP_USER $WP_USER_MAIL --role=editor --user_pass=$WP_USER_PASSWORD --path=/var/www/wordpress
  #wp theme install --activate twentyseventeen --path=/var/www/wordpress
  touch /var/www/wordpress/home_page_created.txt
fi


php-fpm82 --nodaemonize 