#!/usr/bin/python
import configparser
import glob
from pathlib import Path
from termcolor import colored,cprint

parser = configparser.ConfigParser()
parser.read(str(Path.home()) + '/.config/limine-hook/limine-hook.conf')

def info(text, color):
    cprint('#########################################################', 'magenta', 'on_black', attrs=['bold'])
    cprint(text, color, 'on_black')
    cprint('#########################################################', 'magenta', 'on_black', attrs=['bold'])

def formatText(text):
    return colored(text, 'yellow', 'on_black')

def data(text):
    return colored(text, 'green', 'on_black')


info('::: Config Informations Found','yellow')
print(formatText('Root Partition: ') + data(parser.get('config','root_part')))
kernels = glob.glob('/boot/vmlinuz*')
print('Found {} kernels: '.format(len(kernels)))
for k in kernels:
    print(formatText('=> ') + data(k.replace('/boot/vmlinuz-','')))








