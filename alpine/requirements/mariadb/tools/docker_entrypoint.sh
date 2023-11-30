#!/bin/sh
set -e
openrc default
rc-service mariadb setup
rc-service mariadb start

# wordpress db sql
mysql -e "CREATE DATABASE IF NOT EXIST $DB_NAME;"
mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

rc-service mariadb stop
exec mysqld --user=root