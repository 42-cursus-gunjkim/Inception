FROM debian:11.8
LABEL maintainer "gunjoong-kim"

COPY ./tools/init_mariadb.sh /tmp/

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y tini mariadb-server && \
	rm -rf /var/lib/apt/lists/* && \
	chmod +x /tmp/init_mariadb.sh

COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod 644 /etc/mysql/mariadb.conf.d/50-server.cnf

ENTRYPOINT ["/usr/bin/tini", "--", "/tmp/init_mariadb.sh"]

EXPOSE 3306

