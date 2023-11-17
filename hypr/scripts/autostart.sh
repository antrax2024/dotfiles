#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}


run nm-applet &
run dunst &
run flameshot &
run blueberry-tray &
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
run insync start &
run copyq &



