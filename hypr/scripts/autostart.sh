#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

run /home/gargula/dotfiles/waybar/launch.sh & 
run wpaperd &
run nm-applet &
run dunst &
run blueberry-tray &
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
run insync start --qt-qpa-platform=xcb &
run copyq &
# Pipewire UP
run pipewire & 
run pipewire-pulse & 
run wireplumber &
# Screensaver
run swayidle -w timeout 5 '/home/gargula/dotfiles/bin/screensaver.sh' &


