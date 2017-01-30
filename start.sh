#!/bin/bash

echo " "
echo " "

echo "Make sure you forwarded ports, the command should like something like the below..."
echo " docker run -it -p 0.0.0.0:20560:20560/udp -p 0.0.0.0:27015:27015/udp -p 0.0.0.0:7777:7777/udp -p 0.0.0.0:8080:8080 sequel7/killingfloor2"

echo " "
echo " "

sleep 6

WINEDEBUG="fixme-all" unbuffer wine /opt/server/Binaries/Win64/KFServer.exe kf-bioticslab?difficulty=0?maxplayers=20 -port=7777
