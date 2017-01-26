#!/bin/bash

/bin/bash /assets/config.sh

cd $STEAM_FORCE_INSTALL
echo "-= Starting 7 Days to Die Dedicated Server =-"
./7DaysToDieServer.x86_64 -logfile 7DaysToDieServer_Data/output_log.txt -quit -batchmode -nographics -dedicated -configfile=serverconfig.xml
tail -f 7DaysToDieServer_Data/output_log.txt
sleep 3600
