#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
# Monitor em DP-0
export MONITOR='DisplayPort-0'
xrandr --output $MONITOR --primary --mode 2560x1080 --rate 144.00 &
#xrandr --output LVDS1 --mode 1366x768 --output DP3 --mode 1920x1080 --right-of LVDS1
#xrandr --output HDMI2 --mode 1920x1080 --pos 1920x0 --rotate normal --output HDMI1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output VIRTUAL1 --off
#autorandr horizontal

$HOME/.config/polybar/launch.sh &

#change your keyboard if you need it
#setxkbmap -layout be

keybLayout=$(setxkbmap -v | awk -F "+" '/symbols/ {print $2}')

if [ $keybLayout = "be" ]; then
  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc-azerty &
else
  run sxhkd -c ~/.config/bspwm/sxhkd/sxhkdrc &
fi

#wallpaper for other Arch based systems
#feh --bg-fill /usr/share/archlinux-tweak-tool/data/wallpaper/wallpaper.png &
feh --randomize --bg-fill /home/gargula/dotfiles/wallpapers/*

dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
xsetroot -cursor_name left_ptr &

run nm-applet &
run pamac-tray &
run xfce4-power-manager &
run dunst &
run xfce4-clipman &
run flameshot &
numlockx on &
blueberry-tray &
#picom --config $HOME/.config/bspwm/picom.conf &
run picom &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
run volumeicon &
#run /home/gargula/dotfiles/nvidia-fan-control/nvidia-fan-curve.sh &
run insync start &


