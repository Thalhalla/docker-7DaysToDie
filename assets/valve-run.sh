#!/bin/bash

/bin/bash /assets/config.sh

cd $STEAM_FORCE_INSTALL
echo "-= Starting 7 Days to Die Dedicated Server =-"
./startserver.sh -quit -batchmode -nographics -configfile=serverconfig.xml -dedicated
