#!/bin/bash
#

source "/home/antrax/dotfiles/bin/rainbow.sh"

ga=$(echogreen "==>")

echo "Update $HOME/dotfiles..."
cd "$HOME/dotfiles" || exit
git add -A
git commit -a
git push
