#!/bin/sh

MYIP=`curl -s ifconfig.me`

if [ "$MYIP" = "" ]; then
    echo "network down"
    logger -t network-test network down
    reboot
else
    echo "network up"
    logger -t network-test network up
fi

