FROM alpine

RUN apk add --no-cache py2-pip py2-cryptography py2-flask py2-pillow py2-redis libsmbclient \
 && apk add --no-cache --virtual .build-deps coreutils gcc pkgconfig samba-dev python2-dev libc-dev \
 && pip install pysmbc bargate \
 && apk del .build-deps \
#  && apk add --no-cache uwsgi uwsgi-python uwsgi-http
 && apk add --no-cache py2-gunicorn

EXPOSE 5000
# ENV FLASK_APP=bargate:app
# CMD ["uwsgi", "--plugins", "http,python", "--http", "0.0.0.0:5000", "--module", "bargate:app"]

ENTRYPOINT ["gunicorn"]
CMD ["--config", "/etc/gunicorn-config.py", "bargate:app"]

COPY gunicorn-config.py /etc/gunicorn-config.py
COPY bargate.conf /etc/bargate.conf
COPY shares.conf /etc/bargate/shares.conf
COPY templates /etc/bargate/templates/

