#!/bin/bash

cd /home/steam/serverfiles/

cp /assets/cfg/serveradmin_template.xml ./
cp /assets/cfg/serverconfig_template.xml ./

sed -i "s/REPLACEME_CONTROLPANEL_PASSWORD/$REPLACEME_CONTROLPANEL_PASSWORD/" ./serverconfig_template.xml
sed -i "s/REPLACEME_TELNET_PASSWORD/$REPLACEME_TELNET_PASSWORD/" ./serverconfig_template.xml
