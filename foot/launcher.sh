#!/bin/sh
# start foot --server
# ----------------------------------------------------- 
# Quit running waybar instances
# ----------------------------------------------------- 
killall foot

# ----------------------------------------------------- 
# Loading the configuration based on the username
# ----------------------------------------------------- 
foot --server & disown
