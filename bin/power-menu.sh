#!/bin/bash

entries="⭮ Reboot\n⏻ Shutdown"

selected=$(echo -e $entries|wofi --width 250 --height 110 --dmenu --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  reboot)
    exec loginctl reboot;;
  shutdown)
    exec loginctl poweroff -i;;
esac
