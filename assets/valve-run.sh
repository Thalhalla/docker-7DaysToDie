#!/bin/bash

/bin/bash /assets/config.sh

cd $STEAM_FORCE_INSTALL
./sdtdserver start
echo "started server"
sleep 10
echo "retreiving details"
sleep 3
./sdtdserver details
sleep 300
# infinite loop to keep it open for Docker
while true; do ./sdtdserver monitor; sleep 300; done
