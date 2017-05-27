FROM sequel7/steamcmd:14.04

ENV STARTINGMAP='kf-bioticslab'
ENV DIFFICULTY='1'
ENV MAXPLAYERS='20'
ENV PORT='7777'

EXPOSE 7777/udp
EXPOSE 8080
EXPOSE 27015/udp
EXPOSE 20560/udp

USER root

RUN apt-get update \
  && apt-get install -y software-properties-common python-software-properties expect tcl winbind

RUN dpkg --add-architecture i386

RUN add-apt-repository ppa:wine/wine-builds \
  && apt-get update \
  && apt-get install -y --install-recommends winehq-staging

COPY unbuffer /usr/bin/unbuffer

USER steam
RUN ./steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /opt/server/ +app_update 232130 validate +quit

COPY start.sh /opt/server/start.sh
RUN chown steam:steam /opt/server/start.sh
ENTRYPOINT /opt/server/start.sh
