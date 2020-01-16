
ARG GFORTHVERSION=0.7.9_20200116
ARG NET2OVERSION=0.9.7-20200116

FROM forthy42/gforth:latest

LABEL maintainer="Bernd Paysan <bernd@net2o.de>"

# change to trunk 
ENV VERSION ${NET2OVERSION}

VOLUME /net2o
WORKDIR /net2o
USER root
ENV USER root
ENV LANG C.UTF-8
ENV NET2O_CONF /net2o/config

RUN apk add --no-cache build-base \
    && apk add --no-cache --virtual .build-deps \ 
      fossil git m4 file libtool libffi-dev libltdl g++ mesa-dev libx11-dev \
      autoconf automake pcre-dev bison boost zlib-dev coreutils mesa-gles \
    && mkdir /tmp/net2o-src \
    && cd /tmp/net2o-src \
    && fossil clone https://fossil.net2o.de/net2o net2o.fossil \
    && fossil open net2o.fossil $VERSION  \
    && git clone https://github.com/forthy42/ed25519-donna.git \
    && ./autogen.sh --prefix=/usr \
    && make configs && make no-config && make install-libs -i \
    && make libcc \
    && make install libcc-install \
    && cd / \
    && apk del .build-deps \
    && rm -rf /tmp/net2o-src \
    && n2o version 

CMD [ "n2o" ]

ENTRYPOINT ["n2o"]
