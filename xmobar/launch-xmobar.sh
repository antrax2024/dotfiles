#!/usr/bin/bash

TARGET='xmobar'

PID=(`pgrep -x $TARGET`)
if [[ $PID -ne 0 ]]; then 
  kill -9 $PID
fi

echo "Running new Instance..."
xmobar -A 180 $HOME/dotfiles/xmobar/xmobarrc &
exit 0;
