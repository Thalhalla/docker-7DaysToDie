#!/bin/bash

sudo chown -R steam:steam /home/steam
mkdir -p $STEAM_FORCE_INSTALL
#cp /assets/steamer.txt $STEAM_FORCE_INSTALL

cd $STEAM_FORCE_INSTALL
#sed -i "s/REPLACEME_USERNAME/$STEAM_USERNAME/" steamer.txt
#sed -i "s/REPLACEME_PASSWORD/$STEAM_PASSWORD/" steamer.txt
#sed -i "s/REPLACEME_GID/$STEAM_GID/" steamer.txt
#sed -i "s/REPLACEME_FORCE_INSTALL/$STEAM_FORCE_INSTALL/" steamer.txt

echo '@ShutdownOnFailedCommand 1' > ./steamer.txt
echo '@NoPromptForPassword 1' >> ./steamer.txt
echo 'login '.$STEAM_USERNAME.' '.$STEAM_PASSWORD >> ./steamer.txt
echo 'force_install_dir '.$STEAM_FORCE_INSTALL >> ./steamer.txt
echo 'app_update '.$STEAM_GID >> ./steamer.txt
echo 'quit' >> ./steamer.txt

$STEAM_CMD_PATH/steamcmd.sh +runscript $STEAM_FORCE_INSTALL/steamer.txt
sudo chown -R steam:steam $STEAM_FORCE_INSTALL
