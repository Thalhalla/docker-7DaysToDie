#!/bin/bash

sudo chown -R steam:steam /home/steam
mkdir -p $STEAM_FORCE_INSTALL
cp /assets/steamer.txt /home/steam/
cd /home/steam
sed -i "s/REPLACEME_USERNAME/$STEAM_USERNAME/" steamer.txt
sed -i "s/REPLACEME_PASSWORD/$STEAM_PASSWORD/" steamer.txt
sed -i "s/REPLACEME_GID/$STEAM_GID/" steamer.txt
sed -i "s/REPLACEME_FORCE_INSTALL/$STEAM_FORCE_INSTALL/" steamer.txt

./steamcmd.sh +runscript /home/steam/steamer.txt
sudo chown -R steam:steam /home/steam
