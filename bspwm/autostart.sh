#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
# Monitor em DP-0
#export MONITOR='DisplayPort-0'
#xrandr --output $MONITOR --primary --mode 2560x1080 --rate 144.00 &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal

$HOME/.config/polybar/launch.sh &

#change your keyboard if you need it
setxkbmap -layout br
run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &

#wallpaper for other Arch based systems
#feh --bg-fill /usr/share/archlinux-tweak-tool/data/wallpaper/wallpaper.png &
feh --randomize --bg-fill /home/gargula/dotfiles/wallpapers/*

xsetroot -cursor_name left_ptr &

run $HOME/dotfiles/bspwm/scripts/pipewire-up.sh &
run nm-applet &
run pamac-tray &
run dunst &
run xfce4-clipman &
run flameshot &
run numlockx on &
run blueberry-tray &
run picom --config /home/gargula/dotfiles/bspwm/picom.conf &
run /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
volumeicon &
run insync start &


