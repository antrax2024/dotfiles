#!/usr/bin/bash
#
#
#
#



DST="$HOME/.config/nvim"
DOTFILES="$HOME/dotfiles"

rm -rfv "$DST"
mv ~/.config/nvim{,.bak}
mv ~/.local/share/nvim{,.bak}
mv ~/.local/state/nvim{,.bak}
mv ~/.cache/nvim{,.bak}

git clone https://github.com/LazyVim/starter $DST
rm -rf "$DST/.git"

#delete lazyvim.json
rm -rfv $DST/lazyvim.json
#link lazyvim.json
ln -sf "$DOTFILES/nvim/lazyvim.json" "$DST/lazyvim.json"

#delete lua/plugins
rm -rfv $DST/lua/plugins
#link lua/plugins
ln -sf $DOTFILES/nvim/lua/plugins $DST/lua/plugins

#delete lua/config
rm -rfv "$DST/lua/config"
#link lua/config
ln -sf $DOTFILES/nvim/lua/config $DST/lua/config
