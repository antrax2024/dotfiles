#!/usr/bin/bash

TARGET='trayer'

PID=(`pgrep -x $TARGET`)
if [[ $PID -ne 0 ]]; then 
  kill -9 $PID
fi


echo "Running new Instance..."
trayer --edge top --align right --transparent true --tint 0x00000000 --SetDockType true  --alpha 200 --height 30 --distance 0 --margin 10 --widthtype request --SetPartialStrut true --expand true &

exit 0;
