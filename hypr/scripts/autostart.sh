#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run /home/gargula/dotfiles/waybar/launch.sh & 
run nm-applet &
run dunst &
run flameshot &
run blueberry-tray &
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
run insync start --qt-qpa-platform=xcb &
run copyq &
run pipewire & 
run pipewire-pulse & 
run wireplumber &


