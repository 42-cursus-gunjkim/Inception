FROM alpine:3.17
LABEL maintainer="gunjkim"

COPY ./tools/docker_entrypoint.sh /tmp/docker_entrypoint.sh

RUN apk update && \
	apk upgrade && \
	apk add tini openrc nginx && \
	chmod +x /tmp/docker_entrypoint.sh

COPY ./conf/default.conf /etc/nginx/http.d/default.conf

VOLUME ["/var/www/html/wordpress"]

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["sh", "/tmp/docker_entrypoint.sh"]

EXPOSE 9000 80