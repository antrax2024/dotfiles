#!/usr/bin/bash
#


LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)

rm ~/$HOME/.config/lvim/config.lua
ln -sf $HOME/dotfiles/lvim/config.lua $HOME/.config/lvim/config.lua
