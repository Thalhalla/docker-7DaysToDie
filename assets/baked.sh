#!/bin/bash

/bin/bash /assets/config.sh

cd $STEAM_FORCE_INSTALL
while [ 1 ]
do
    ./startserver.sh -configfile=serverconfig.xml -dedicated
    sleep 3
    echo "-= Restarting 7 Days to Die Dedicated Server =-"
    sleep 3
done
