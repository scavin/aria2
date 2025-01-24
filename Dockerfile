FROM alpine:edge
LABEL maintainer="Appinn <contact@appinn.com>"

ENV ARIA2_VERSION=1.37.0

RUN set -x \
    && resolve() { echo $(apk search $1 | grep "^$1-$2" | sed -e "s/$1-//g") ; } \
    && apk add -U \
    && apk add --no-cache --update aria2 \
    && rm -rf \
           /var/cache/apk/*

ENTRYPOINT [ "/usr/bin/aria2c" ]
