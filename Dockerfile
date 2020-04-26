#
# Dockerfile for shadowsocksr-libev client
#

FROM alpine:3.8

ENV SS_URL https://github.com/shadowsocksrr/shadowsocksr-libev/archive/Akkariiin/master.tar.gz
ENV SS_DIR shadowsocksr-libev-Akkariiin-master

RUN set -ex \
    && apk add --no-cache --virtual .run-deps \
        pcre \
        libev \
        c-ares \
        libsodium \
        mbedtls \
        rng-tools \
    && apk add --no-cache --virtual .build-deps \
        curl \
        git \
        autoconf \
        build-base \
        libtool \
        linux-headers \
        libressl-dev \
        zlib-dev \
        asciidoc \
        xmlto \
        pcre-dev \
        automake \
        mbedtls-dev \
        libsodium-dev \
        c-ares-dev \
        libev-dev \
    && curl -sSL $SS_URL | tar xz \
    && cd $SS_DIR \
    && ./configure \
    && make \
    && make install \
    && cd .. \
    && rm -rf $SS_DIR \
    && apk del .build-deps \
    && rm -rf /var/cache/apk
    
RUN mv /usr/local/bin/ss-local /usr/local/bin/tutarl
RUN mv /usr/local/bin/ss-redir /usr/local/bin/tutarr
RUN mv /usr/local/bin/ss-nat /usr/local/bin/tutarn

CMD ["tutarl", "-c", "/etc/tutarl.json"]
