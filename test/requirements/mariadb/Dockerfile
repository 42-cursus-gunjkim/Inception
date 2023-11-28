FROM alpine:3.18
RUN apk update && \
	apk add --no-cache mariadb mariadb-client openrc

COPY ./conf/mysql_secure_installation.sql /home/
COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/
COPY ./conf/create_wordpressdb_user.sql /home/
COPY ./conf/start_mariadb.sh /home

VOLUME ["/var/lib/mysql"]

EXPOSE 3306
