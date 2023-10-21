#!/usr/bin/bash

DOTFILES=$HOME/dotfiles

FILE=$1

mpv --no-audio --config-dir="$DOTFILES/mpv-conf-screensaver" "$HOME/Google-Drive/screensavers/$FILE"
