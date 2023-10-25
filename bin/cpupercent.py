#!/usr/bin/python 

import psutil

cpuPercent = psutil.cpu_percent(interval=1, percpu=False)


print("{}".format(cpuPercent))



