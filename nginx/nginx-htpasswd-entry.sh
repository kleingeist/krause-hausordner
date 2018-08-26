#!/bin/sh
if [ ! -z "$HAUSORDNER_USER" ] && [ ! -z "$HAUSORDNER_PASS" ]; then
  /usr/bin/htpasswd -bc /var/www/hausordner.htpasswd $HAUSORDNER_USER $HAUSORDNER_PASS || exit 1
fi
if [ ! -z "$ADMIN_USER" ] && [ ! -z "$ADMIN_PASS" ]; then
  /usr/bin/htpasswd -b /var/www/hausordner.htpasswd $ADMIN_USER $ADMIN_PASS || exit 1
  /usr/bin/htpasswd -bc /var/www/admin.htpasswd $ADMIN_USER $ADMIN_PASS || exit 1
fi

exec "$@"
