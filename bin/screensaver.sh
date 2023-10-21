#!/usr/bin/bash

DOTFILES=$HOME/dotfiles

FILE=$1

mpv --no-audio --config-dir="$DOTFILES/screensaver" "$DOTFILES/screensaver/$FILE"
