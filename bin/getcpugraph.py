#!/usr/bin/python 

import psutil

cpuPercent = round(psutil.cpu_percent(interval=1, percpu=False))

graph = cpuPercent 

print("{}".format(cpuPercent))



