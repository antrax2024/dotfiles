#!/usr/bin/bash

TARGET='xmobar'

PID=(`pgrep -f $TARGET`)

if [[ $PID -ne 0 ]]; then
  echo "$TARGET running. Killing now..."
  killall -q $TARGET
  echo "Ok"
fi


echo "Running new Instance..."
xmobar -A 180 $HOME/dotfiles/xmobar/xmobarrc &
exit 0;
