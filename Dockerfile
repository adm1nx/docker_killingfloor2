FROM sequel7/steamcmd:latest

USER root

RUN apt-get update \
  && apt-get install -y software-properties-common python-software-properties

RUN add-apt-repository ppa:wine/wine-builds \
  && apt-get install --install-recommends wine-staging
  && apt-get install wine-staging

