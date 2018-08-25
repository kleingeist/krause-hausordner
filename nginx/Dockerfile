FROM nginx:alpine
ARG ANGULAR_FILEMANAGER_VERSION=master

RUN addgroup -g 1111 krause &&\
    adduser -D -H -u 1111 -G krause krause

VOLUME /var/www/files
WORKDIR /var/www/html

RUN apk add --no-cache --virtual .image-runtime-deps apache2-utils &&\
    touch /var/www/htpasswd

ADD default.conf /etc/nginx/conf.d/default.conf
ADD index.html /var/www/html/
ADD https://github.com/joni2back/angular-filemanager/archive/$ANGULAR_FILEMANAGER_VERSION.tar.gz /tmp/
RUN tar xzf /tmp/$ANGULAR_FILEMANAGER_VERSION.tar.gz -C /tmp/ &&\
    mv /tmp/angular-filemanager-$ANGULAR_FILEMANAGER_VERSION/node_modules /var/www/html/node_modules &&\
    mv /tmp/angular-filemanager-$ANGULAR_FILEMANAGER_VERSION/dist /var/www/html/node_modules/angular-filemanager

ADD nginx-htpasswd-entry.sh /usr/local/bin/nginx-htpasswd-entry.sh

ENTRYPOINT ["/usr/local/bin/nginx-htpasswd-entry.sh"]
CMD ["nginx", "-g", "daemon off;"]
