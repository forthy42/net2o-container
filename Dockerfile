FROM mtrute/gforth-container:latest

ENV DEBIAN_FRONTEND noninteractive
ENV NET2O_CONF /net2o/config

VOLUME /net2o

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y net2o \
    && mkdir -p /pub

CMD [ "n2o" "gforth" ]
