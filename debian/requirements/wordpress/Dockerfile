FROM debian:11.8
LABEL maintainer "gunjoong-kim"

COPY ./tools/init_wordpress.sh /tmp/

RUN apt-get update -y && \
	apt-get upgrade -y && \
	apt-get install -y tini php7.3 php-fpm php-mysql mariadb-client wget && \
	chmod +x /tmp/init_wordpress.sh

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

ENTRYPOINT ["/usr/bin/tini", "--", "/tmp/init_wordpress.sh"]

EXPOSE 3306 9000