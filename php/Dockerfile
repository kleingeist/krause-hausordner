FROM alpine as builder
ARG ANGULAR_FILEMANAGER_VERSION=master

ADD handler.php /var/www/php/
ADD https://github.com/joni2back/angular-filemanager/archive/$ANGULAR_FILEMANAGER_VERSION.tar.gz /tmp/
RUN tar xzf /tmp/$ANGULAR_FILEMANAGER_VERSION.tar.gz -C /tmp/ &&\
    mv /tmp/angular-filemanager-$ANGULAR_FILEMANAGER_VERSION/bridges/php-local/lang /var/www/php/ &&\
    mv /tmp/angular-filemanager-$ANGULAR_FILEMANAGER_VERSION/bridges/php-local/LocalBridge /var/www/php/


# FROM php:fpm-alpine // fpm-alpine is not working on arm
FROM php:fpm
ARG UID=1111
ARG USER_NAME=www-docker-user

# fpm-alpine
# RUN addgroup -g 2222 krause &&\
#     adduser -D -H -u 2222 -G krause krause

COPY --from=builder /var/www/php /var/www/php
RUN addgroup --gid $UID $USER_NAME &&\
    adduser --uid $UID --gid $UID --disabled-password --disabled-login --no-create-home --gecos "" $USER_NAME &&\
    chown -R $UID:$UID /var/www/php &&\
    { \
      echo "[www]"; \
      echo "user = $USER_NAME"; \
      echo "group = $USER_NAME"; \
    } | tee /usr/local/etc/php-fpm.d/yy-www-user.conf
