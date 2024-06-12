#!/usr/bin/env -S PYENV_VERSION=dotfiles-bin python

import json
import subprocess
from colorama import Fore, Back, Style, init
init(autoreset=True)

version=0.12


print(Fore.YELLOW + '=============================================')
print(Fore.GREEN + 'Hyprwindow version ' + str(version))
print(Fore.YELLOW + '=============================================')

print('Please, click in the window and the magical happen...')

data = subprocess.run(['/home/gargula/dotfiles/bin/hyprprop.sh'], capture_output=True)



jsondata = json.loads(data.stdout.decode('utf-8'))


print(jsondata)


initialTitle = jsondata['initialTitle']

initialClass = jsondata['initialClass']



comment = "# Floating [Title = {} Class = {}]".format(initialTitle, initialClass)
ruleLine = 'windowrulev2 = float,class:({}) title:({})'.format(initialClass, initialTitle)

print(comment)
print(ruleLine)

# windowrulev2 = float,class:(org.qbittorrent.qBittorrent) title:(qBittorrent v4.6.5)

