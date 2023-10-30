#!/usr/bin/bash

cd ~/dotfiles

echo "Digita o texto do commit, bebê: "
read commit_var

git add -A
git commit -m "$commit_var"

git push

