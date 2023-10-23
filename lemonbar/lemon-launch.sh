#!/usr/bin/bash


killall -q lemonbar
killall -q lemon-config.sh

$HOME/dotfiles/lemonbar/lemon-config.sh | lemonbar -p -F#FFFFFFFF -B#FF222222 -f "Hack Nerd Font Propo"-14 -f FontAwesome-14
