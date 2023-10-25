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

#trayer --edge top --align right --transparent true --tint 0x00000000 --SetDockType true  --alpha 200 --height 30 --distance 0 --margin 10 --widthtype request --SetPartialStrut true --expand true &
trayer --edge top --align right --transparent true --tint 0x000000 --SetDockType false --height 30 --distance 0 --margin 10 --widthtype request --SetPartialStrut true --expand true &
