#!/bin/sh
# start waybar and programs with tray icons after pause

sleep 20
insync start &
nm-applet --indicator &
blueman-applet &
