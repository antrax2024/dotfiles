#!/usr/bin/bash
#
#
#
#
TARGET="trayer"

if pidof -x $TARGET > /dev/null
then
    echo "running"
    killall trayer
else 
    echo "not running"
fi

trayer --edge top --align right --transparent true --alpha 0 --tint 0x000000 --SetDockType true --height 30 --distance 0 --margin 10 --widthtype request --SetPartialStrut false --expand true --monitor DP-0 &
