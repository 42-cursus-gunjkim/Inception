FROM alpine:3.17
LABEL maintainer="gunjkim"

COPY ./tools/docker_entrypoint.sh /tmp/

RUN apk update && \
	apk upgrade && \
	apk add openrc mysql mysql-client tini && \
	chmod +x /tmp/docker_entrypoint.sh

COPY ./conf/mariadb-server.cnf /etc/my.cnf.d/

RUN chmod 644 ./etc/my.cnf.d/mariadb-server.cnf

WORKDIR /tmp

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["sh", "/tmp/docker_entrypoint.sh"]

EXPOSE 3306