#!/bin/sh
# start waybar and programs with tray icons after pause

sleep 20

# Sound Applet
pasystray &
# Google Drive
insync start &
# Network Applet
nm-applet --indicator &
# Bluetooth Applet
blueman-applet &

