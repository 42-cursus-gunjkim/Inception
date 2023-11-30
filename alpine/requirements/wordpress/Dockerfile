FROM alpine:3.17
LABEL maintainer="gunjkim"

COPY ./tools/docker_entrypoint.sh /tmp/

RUN apk update && \
	apk upgrade && \
	apk add tini openrc php81 php81-fpm wget php81-mysqli php81-phar && \
	chmod +x /tmp/docker_entrypoint.sh

COPY ./conf/www.conf /etc/php81/php-fpm.d/www.conf

WORKDIR /tmp

VOLUME ["/var/www/html/wordpress"]

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["sh", "/tmp/docker_entrypoint.sh"]

EXPOSE 3306 9000