FROM mtrute/gforth-container:latest

ENV DEBIAN_FRONTEND noninteractive
ENV NET2O_CONF /net2o/.net2o/config
ENV HOME /net2o

VOLUME /net2o

RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y net2o

CMD [ "n2o" "gforth" ]
