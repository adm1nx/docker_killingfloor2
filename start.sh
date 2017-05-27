#!/bin/bash

echo " "
echo " "

echo "Make sure you forwarded ports, the command should like something like the below..."
echo "docker run -it -p 0.0.0.0:7777:7777/udp sequel7/killingfloor2"

echo " "
echo " "

sleep 6

./steamcmd.sh +@sSteamCmdForcePlatformType windows +login anonymous +force_install_dir /opt/server/ +app_update 232130 +quit

WINEDEBUG="fixme-all" unbuffer wine /opt/server/Binaries/Win64/KFServer.exe $(STARTINGMAP)?difficulty=$(DIFFICULTY)?maxplayers=$(MAXPLAYERS) -port=$(PORT)
