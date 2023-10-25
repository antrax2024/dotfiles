#!/usr/bin/python 

import psutil


factor = (1024 * 1024 * 1024)

 
used = round(psutil.disk_usage("/").used/factor)
total = round(psutil.disk_usage("/").total/factor)
#used = disk.

print("{}G/{}G".format(used,total))

