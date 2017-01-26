#!/bin/bash

cd $STEAM_FORCE_INSTALL

cp /assets/cfg/serverconfig_template.xml $STEAM_FORCE_INSTALL/serverconfig.xml
cp /assets/cfg/serveradmin_template.xml $STEAM_FORCE_INSTALL/serveradmin.xml

sed -i "s/REPLACEME_CONTROLPANEL_PASSWORD/$REPLACEME_CONTROLPANEL_PASSWORD/" ./serverconfig.xml
sed -i "s/REPLACEME_TELNET_PASSWORD/$REPLACEME_TELNET_PASSWORD/" ./serverconfig.xml
