#!/bin/bash

set -e

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Lee/CN=localhost" -keyout /etc/ssl/private/server_pkey.pem -out /etc/ssl/certs/server.crt
chmod 600 /etc/ssl/private/server_pkey.pem
chmod 600 /etc/ssl/certs/server.crt

nginx -t
service nginx start

exec "$@"