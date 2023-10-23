#!/usr/bin/env bash
# ---
# Use "run program" to run it only if it is not already running
# Use "program &" to run it regardless
# ---
# NOTE: This script runs with every restart of AwesomeWM
# TODO: run_once


function run {
    if ! pgrep $1 > /dev/null ;
    then
        $@&
    fi
}


run setxkbmap br &
run killall nvidia-fan.sh
run /home/gargula/dotfiles/bin/nvidia-fan.sh &
run copyq --start-server &
run picom --daemon &
run nitrogen --restore & 
run /usr/lib/polkit-kde-authentication-agent-1 &
run dunst &
run insync start &
run blueman-applet &
run nm-applet &
run xmobar -A 180 $HOME/dotfiles/xmobar/xmobarrc &
run trayer --edge top --align right --transparent true --tint 0x00000000 --SetDockType true  --alpha 200 --height 30 --distance 0 --margin 10 --widthtype request --SetPartialStrut true --expand true &

