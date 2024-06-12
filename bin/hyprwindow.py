#!/usr/bin/env -S PYENV_VERSION=dotfiles-bin python

import json
import subprocess
from colorama import Fore, Back, Style, init
init(autoreset=True)


def append_lines_to_file(file_path, lines_to_append): 
	try: 
		with open(file_path, 'a') as file: 
			file.write('\n'.join(lines_to_append) + '\n') 
		print(f"Lines appended to {file_path} successfully.") 
	except Exception as e: 
		print(f"Error: {e}") 


version=0.12


print(Fore.YELLOW + '=============================================')
print(Fore.GREEN + 'Hyprwindow version ' + str(version))
print(Fore.YELLOW + '=============================================')

print('Please, click in the window and the magical happen...')

data = subprocess.run(['/home/gargula/dotfiles/bin/hyprprop.sh'], capture_output=True)



jsondata = json.loads(data.stdout.decode('utf-8'))




initialTitle = jsondata['initialTitle']

initialClass = jsondata['initialClass']



comment = "# Floating [Title = {} Class = {}]".format(initialTitle, initialClass)
ruleLine = 'windowrulev2 = float,class:({}) title:({})'.format(initialClass, initialTitle)

file_path = '/home/gargula/dotfiles/hypr/hyprland.conf'
lines_to_append = [comment, ruleLine]
append_lines_to_file(file_path, lines_to_append)


print(comment)
print(ruleLine)

print(Fore.GREEN + "Lines appended with success!")

