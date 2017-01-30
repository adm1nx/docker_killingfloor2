FROM sequel7/steamcmd:14.04

USER root

RUN apt-get update \
  && apt-get install -y software-properties-common python-software-properties expect tcl

RUN dpkg --add-architecture i386

RUN add-apt-repository ppa:wine/wine-builds \
  && apt-get update \
  && apt-get install -y --install-recommends winehq-staging
