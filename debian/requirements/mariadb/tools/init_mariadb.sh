#!/bin/bash

service mariadb start

# # mysql_secure_installation
# mysql -e "ALTER USER root@localhost IDENTIFIED VIA mysql_native_password USING PASSWORD('$DB_PASSWORD');"
# mysql -e "DELETE FROM mysql.user WHERE User='';"
# mysql -e "DROP DATABASE IF EXISTS test;"
# mysql -e "DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';"
# mysql -e "FLUSH PRIVILEGES;"

# wordpress db sql
# mysql -e "CREATE DATABASE $DB_NAME;"
# mysql -e "CREATE USER '$DB_USER'@'%' IDENTIFIED BY '$DB_PASSWORD';"
# mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' WITH GRANT OPTION;"
# mysql -e "FLUSH PRIVILEGES;"

# service mariadb restart

exec "$@"

