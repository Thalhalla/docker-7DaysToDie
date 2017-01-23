#!/bin/bash

sudo chown -R steam:steam /home/steam
mkdir -p /home/steam/7DaysToDie
cp /assets/steamer.txt /home/steam/
cd /home/steam
sed -i "s/REPLACEME_USERNAME/$STEAM_USERNAME/" steamer.txt
sed -i "s/REPLACEME_PASSWORD/$STEAM_PASSWORD/" steamer.txt
sed -i "s/REPLACEME_GID/$STEAM_GID/" steamer.txt

cd /opt/steamer
./steamcmd.sh +runscript /home/steam/steamer.txt
cd /home/steam
sudo chown -R steam:steam /home/steam
