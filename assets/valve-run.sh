#!/bin/bash

/bin/bash /assets/config.sh

cd $STEAM_FORCE_INSTALL
echo "-= Starting 7 Days to Die Dedicated Server =-"
./7DaysToDie.x86 -logfile 7DaysToDie_Data/output_log.txt -quit -batchmode -nographics -configfile=serverconfig.xml -dedicated
tail -f 7DaysToDie_Data/output_log.txt
sleep 3600
