FROM debian:9-slim

ENV DEBIAN_FRONTEND noninteractive

ENV LANG C.UTF-8
ENV NET2O_CONF /net2o/config

VOLUME /net2o
WORKDIR /net2o

RUN apt-get update \
    && apt-get install --no-install-recommends -y  software-properties-common apt-utils gnupg apt-transport-https curl \
    && curl -L https://net2o.de/bernd@net2o.de-yubikey.pgp.asc | apt-key add - \
    && apt-add-repository 'deb https://net2o.de/debian testing main' \
    && apt-get update && apt-get install -y net2o libtool-bin \
    && apt-get autoremove -y

CMD [ "n2o" ]

ENTRYPOINT [ "n2o" ]
