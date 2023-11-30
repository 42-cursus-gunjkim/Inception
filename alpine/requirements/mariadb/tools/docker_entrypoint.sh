#!/bin/sh
set -e
openrc default
mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld
if [ ! -d "/var/lib/mysql/$DB_NAME" ]; then
    rc-service mariadb setup
    rc-service mariadb start
    mysql -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME}; \
               CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASSWORD}'; \
               GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO '${DB_USER}'@'%' WITH GRANT OPTION; \
               FLUSH PRIVILEGES;"
    rc-service mariadb stop
fi

exec mysqld --user=root