#!/usr/bin/python 

import psutil

temperatures = psutil.sensors_temperatures(fahrenheit=False)
cpuPercent = (psutil.cpu_percent(interval=1, percpu=False))
cpuTemp = round(temperatures['k10temp'][0][1])

print(str(cpuPercent) + "%" + " " + str(cpuTemp) + " °C")

