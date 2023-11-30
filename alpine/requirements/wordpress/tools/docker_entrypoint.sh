#!/bin/sh
set -e

until mysql --host=mariadb --user=$DB_USER --password=$DB_PASSWORD -e '\c'; do
  echo >&2 "mariadb is unavailable - sleeping"
  sleep 1
done

echo >&2 "mariadb is available!!!!!"

if ! wp core is-installed; then
	wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
	chmod +x wp-cli.phar
	mv wp-cli.phar /usr/local/bin/wp
	wp core download --path=/var/www/html/wordpress --allow-root
	wp config create --dbname=$DB_NAME --dbuser=$DB_USER --dbpass=$DB_PASSWORD --dbhost=mariadb --path=/var/www/html/wordpress --allow-root
	wp core install --title=test --url=gunjkim.kr --admin_user=admin --admin_password=admin --admin_email=rjsoownd0419@gmail.com --path=/var/www/html/wordpress --allow-root
fi

exec "$@"