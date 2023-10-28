#!/usr/bin/bash
##################################################
# Prevent duplicate
fork_once() { [ $(pidof -sx $1) ] || $@ & }
##################################################

fork_once setxkbmap br 
fork_once xsetroot -cursor_name left_ptr 

# Auto start apps
fork_once numlockx 
fork_once picom --daemon 
fork_once /usr/lib/polkit-kde-authentication-agent-1  
# Wallpaper
fork_once $HOME/dotfiles/bspwm/change-wallpaper.sh 

# Nvidia Fan
fork_once /home/gargula/dotfiles/bin/nvidia-fan.sh
# eww bar
fork_once eww open bar 


sleep 5
# Tray Icons
fork_once trayer --edge top --align right --transparent true --alpha 0 --tint 0x000000 --SetDockType true --height 30 --distance 0 --margin 10 --widthtype request --SetPartialStrut false --expand true --monitor DP-0 

# tray Applets 
fork_once insync start 
fork_once blueman-applet 
fork_once nm-applet 
fork_once volctl
fork_once copyq --start-server
# change wallpaper after 30min
fork_once xidle -timeout 1800 -program "$HOME/dotfiles/bspwm/change-wallpaper.sh" 
# Screensaver
fork_once xidle -timeout 120 -program "$HOME/dotfiles/bin/screensaver.sh" 
fork_once dunst  
fork_once flameshot 

