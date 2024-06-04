#!/bin/bash

function run {
	if ! pgrep $1; then
		$@ &
	fi
}

#Find out your monitor name with xrandr or arandr (save and you get this line)
#xrandr --output VGA-1 --primary --mode 1360x768 --pos 0x0 --rotate normal
#xrandr --output DP2 --primary --mode 1920x1080 --rate 60.00 --output LVDS1 --off &
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

#feh --bg-fill ~/dotfiles/wallpapers/the_tree_of_life-wallpaper-2560x1080.jpg &
feh --bg-fill ~/dotfiles/wallpapers/beyond_the_story_i-wallpaper-2560x1600.jpg &

dex $HOME/.config/autostart/arcolinux-welcome-app.desktop
xsetroot -cursor_name left_ptr &
compfy &
run nm-applet &
run xfce4-power-manager &
numlockx on &
blueberry-tray &

/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

run dunst &
run keepassxc
run ~/dotfiles/bin/nvidia.sh
run onedrivegui
run xfce4-screensaver &

sleep 5
/usr/bin/copyq &
/usr/bin/surfshark &
