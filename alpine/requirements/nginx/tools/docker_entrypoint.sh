set -e

openrc default

nginx -g "daemon off;"

exec "$@"