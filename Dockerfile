
ARG GFORTHVERSION=0.7.9_20210520
ARG NET2OVERSION=0.9.9-20210520

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
      git m4 file libtool libffi-dev libltdl g++ mesa-dev libx11-dev \
      autoconf automake boost zlib-dev coreutils mesa-gles
RUN cd /tmp \
    && git clone https://github.com/forthy42/net2o net2o \
    && cd net2o \
    && git clone https://github.com/forthy42/ed25519-donna.git \
    && ./autogen.sh --prefix=/usr \
    && make configs && make no-config && make install-libs -i \
    && make libcc \
    && make install libcc-install \
    && cd / \
    && apk del .build-deps \
    && rm -rf /tmp/net2o

CMD [ "n2o" ]

ENTRYPOINT ["n2o"]
