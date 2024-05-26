#!/bin/bash

$ for i in /sys/class/hwmon/hwmon*/temp*_input; 
do 
  echo "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*})) $(readlink -f $i)"; 
done

