FROM alpine:3.17
LABEL maintainer="gunjkim"

COPY ./tools/docker_entrypoint.sh /tmp/

RUN apk update && \
	apk upgrade && \
	apk add tini openrc mariadb-client php81 \
  	php81-fpm php81-json php81-zlib php81-xml php81-xmlwriter php81-simplexml php81-pdo php81-phar php81-openssl \
  	php81-pdo_mysql php81-mysqli php81-session \
  	php81-gd php81-iconv php81-gmp php81-zip \
  	php81-curl php81-opcache php81-ctype php81-apcu \
  	php81-intl php81-bcmath php81-dom php81-mbstring php81-xmlreader php81-tokenizer&& \
	chmod +x /tmp/docker_entrypoint.sh

RUN mkdir -p /var/www/html/wordpress

COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf

WORKDIR /tmp

VOLUME ["/var/www/html/wordpress"]

ENTRYPOINT ["/sbin/tini", "--", "/tmp/docker_entrypoint.sh"]

CMD ["php-fpm81", "--nodaemonize"]

EXPOSE 3306 9000