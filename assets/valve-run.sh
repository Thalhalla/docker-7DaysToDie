#!/bin/bash

/bin/bash /assets/config.sh

cd $STEAM_FORCE_INSTALL
echo "-= Starting 7 Days to Die Dedicated Server =-"
/bin/bash ./7DaysToDie.x86_64 -logfile 7DaysToDie_Data/output_log.txt -quit -batchmode -nographics -dedicated -configfile=serverconfig.xml
tail -f 7DaysToDie_Data/output_log.txt
sleep 3600
