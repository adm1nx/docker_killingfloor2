FROM sequel7/killingfloor2:latest
USER root

RUN apt-get update \
  && apt-get upgrade -y

USER steam
RUN ./steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /opt/server/ +app_update 232130 validate +quit

COPY start.sh /opt/server/start.sh
ENTRYPOINT /opt/server/start.sh
