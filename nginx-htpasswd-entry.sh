#!/bin/sh

if [ ! -z "$AUTH_USER" ] && [ ! -z "$AUTH_PASS" ]; then
  /usr/bin/htpasswd -b /var/www/htpasswd $AUTH_PASS $AUTH_PASS || exit 1
fi

exec "$@"
