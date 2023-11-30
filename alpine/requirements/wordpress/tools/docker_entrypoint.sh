#!/bin/sh
set -e

mkdir -p /var/www/html/wordpress
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp
wp core download --path=/var/www/html/wordpress --allow-root
wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --path=/var/www/html/wordpress --allow-root
wp core install --title=test --admin_user=admin --admin_password=admin --admin_email=rjsoownd0419@gmail.com --path=/var/www/html/wordpress --allow-root

rc-service php-fpm81 start

exec "$@"