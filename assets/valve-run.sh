#!/bin/bash

/bin/bash /assets/config.sh

cd $STEAM_FORCE_INSTALL
echo "-= Starting 7 Days to Die Dedicated Server =-"
./startserver.sh -configfile=serverconfig.xml
sleep 3600
