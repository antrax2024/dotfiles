#!/bin/bash
#
#


SRC='~/dotfiles'
DST='~/.config'


rm -rfv $DST/fish/*
ln -sf $SRC/fish/config.fish $DST/config.fish

rm -rfv $DST/neofetch/*
ln -sf $SRC/neofetch $DST/config.conf


