# FROM php:fpm-alpine // fpm-alpine is not working on arm
FROM php:fpm
ARG ANGULAR_FILEMANAGER_VERSION=master

# fpm-alpine
# RUN addgroup -g 1111 krause &&\
#     adduser -D -H -u 1111 -G krause krause

RUN addgroup --gid 1111 krause &&\
    adduser --uid 1111 --gid 1111 --disabled-password --disabled-login --gecos "" krause

VOLUME /var/www/files
WORKDIR /var/www/php

ADD handler.php /var/www/php/
ADD https://github.com/joni2back/angular-filemanager/archive/$ANGULAR_FILEMANAGER_VERSION.tar.gz /tmp/
RUN tar xzf /tmp/$ANGULAR_FILEMANAGER_VERSION.tar.gz -C /tmp/ &&\
    mv /tmp/angular-filemanager-$ANGULAR_FILEMANAGER_VERSION/bridges/php-local/lang /var/www/php/ &&\
    mv /tmp/angular-filemanager-$ANGULAR_FILEMANAGER_VERSION/bridges/php-local/LocalBridge /var/www/php/ &&\
    chown -R krause:krause /var/www/php

ADD www-overwrites.conf /usr/local/etc/php-fpm.d/yy-www-overwrites.conf
