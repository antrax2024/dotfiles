#!/usr/bin/python 

import psutil

temperatures = psutil.sensors_temperatures(fahrenheit=False)
cpuPercent = round(psutil.cpu_percent(interval=1, percpu=False),1)
cpuTemp = round(temperatures['k10temp'][0][1])

print("{}% {}°C".format(cpuPercent,cpuTemp))

