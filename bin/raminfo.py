#!/usr/bin/python 

import psutil

factor = (1024 * 1024 * 1024)

used=(psutil.virtual_memory().used)/ factor
total=psutil.virtual_memory().total/ factor


print("{}G / {} G".format(round(used,1),round(total,1)))

