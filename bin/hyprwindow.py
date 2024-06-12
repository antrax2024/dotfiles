#!/usr/bin/env -S PYENV_VERSION=dotfiles-bin python

from colorama import Fore, Back, Style, init
init(autoreset=True)

version=0.12


print(Fore.YELLOW + '=============================================')
print(Fore.GREEN + 'Hyprwindow version ' + str(version))
print(Fore.YELLOW + '=============================================')

print('Please, click in the window and the magical happen...')
