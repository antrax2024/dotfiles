#!/usr/bin/python 

import psutil

def convert_bytes(num):
    """
    this function will convert bytes to MB.... GB... etc
    """
    step_unit = 1000.0 #1024 bad the size

    for x in ['bytes', 'KB', 'MB', 'GB', 'TB']:
        if num < step_unit:
            return "%3.1f %s" % (num, x)
        num /= step_unit



usage=psutil.disk_usage('/VMs')

used=convert_bytes(usage.used)
total=convert_bytes(usage.total)

print(used,"/",total)
