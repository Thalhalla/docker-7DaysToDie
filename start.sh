#!/bin/bash

cd /home/steam
echo sed
sed -i 's/steamuser="username"/steamuser=REPLACE_USER/' sdtdserver
sed -i 's/steampass="password"/steampass=REPLACE_PASSWORD/' sdtdserver
sed -i "s/steamuser=REPLACE_USER/steamuser='$STEAM_USERNAME'/" sdtdserver
sed -i "s/steampass=REPLACE_PASSWORD/steampass='$STEAM_PASSWORD'/" sdtdserver
set_steam_guard_code $STEAM_GUARD_CODE
#yes y|./sdtdserver install
cp -v ./serverconfig_template.xml /home/steam/7daystodie/sdtd-server.xml
cp -v ./serveradmin_template.xml /home/steam/7daystodie/serveradmin.xml
#bash /run.sh
