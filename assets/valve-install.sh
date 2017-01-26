#!/bin/bash

sudo chown -R steam:steam /home/steam
mkdir -p $STEAM_FORCE_INSTALL
cp /assets/steamer.txt $STEAM_FORCE_INSTALL

cd $STEAM_FORCE_INSTALL

sed -i "s/REPLACEME_USERNAME/$STEAM_USERNAME/" steamer.txt
sed -i "s/REPLACEME_PASSWORD/$STEAM_PASSWORD/" steamer.txt
sed -i "s/REPLACEME_GID/$STEAM_GID/" steamer.txt
sed -i "s!REPLACEME_FORCE_INSTALL!$STEAM_FORCE_INSTALL!" steamer.txt

$STEAM_CMD_PATH/steamcmd.sh +runscript $STEAM_FORCE_INSTALL/steamer.txt
sudo chown -R steam:steam $STEAM_FORCE_INSTALL
