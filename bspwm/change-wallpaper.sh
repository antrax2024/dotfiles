#!/usr/bin/bash

WALLPAPERS="$HOME/dotfiles/wallpapers/"

RAND=$(find "$WALLPAPERS" -xtype f | sort -R | head -1) 

echo $RAND
xwallpaper --zoom "$RAND"

