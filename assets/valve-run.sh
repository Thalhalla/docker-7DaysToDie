#!/bin/bash

# start a frame buffer
sudo Xvfb &

# perform configuration of this server instance
/bin/bash /assets/config.sh

#cd $STEAM_FORCE_INSTALL
cd /data
echo "-= Starting 7 Days to Die Dedicated Server =-"
mkdir -p 7DaysToDieServer_Data
touch 7DaysToDieServer_Data/output_log.txt
./7DaysToDieServer.x86_64 -logfile 7DaysToDieServer_Data/output_log.txt -quit -batchmode -dedicated -configfile=serverconfig.xml &
tail -f 7DaysToDieServer_Data/output_log.txt
