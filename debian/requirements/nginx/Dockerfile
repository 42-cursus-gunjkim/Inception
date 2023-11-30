FROM debian:11.8
LABEL maintainer "gunjoong-kim"

COPY ./tools/init_nginx.sh /tmp/init_nginx.sh

RUN apt-get -y update && \
	apt-get -y upgrade && \
	apt-get install -y tini nginx openssl && \
	chmod +x /tmp/init_nginx.sh

RUN echo "\ndaemon off;" >> /etc/nginx/nginx.conf

COPY ./conf/default /etc/nginx/sites-available/

ENTRYPOINT ["/usr/bin/tini", "--", "/tmp/init_nginx.sh"]

EXPOSE 9000