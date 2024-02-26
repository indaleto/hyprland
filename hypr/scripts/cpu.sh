#!/bin/sh
#  _   _           _       _             
# | | | |_ __   __| | __ _| |_ ___  ___  
# | | | | '_ \ / _` |/ _` | __/ _ \/ __| 
# | |_| | |_) | (_| | (_| | ||  __/\__ \ 
#  \___/| .__/ \__,_|\__,_|\__\___||___/ 
#       |_|                              
#  
# by Stephan Raabe (2023) 
# ----------------------------------------------------- 
# Requires pacman-contrib trizen

# ----------------------------------------------------- 
# Define threshholds for color indicators
# ----------------------------------------------------- 

threshhold_green=0
threshhold_yellow=50
threshhold_red=95

# ----------------------------------------------------- 
# Calculate cpu usage
# ----------------------------------------------------- 

cpu=$(awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else print ($2+$4-u1) * 100 / (t-t1); }' <(grep 'cpu ' /proc/stat) <(sleep 1;grep 'cpu ' /proc/stat))
cpu=${cpu%.*}
# ----------------------------------------------------- 
# Testing
# ----------------------------------------------------- 

# Overwrite updates with numbers for testing
# updates=100

# test JSON output
# printf '{"text": "0", "alt": "0", "tooltip": "0 Updates", "class": "red"}'
# exit

# ----------------------------------------------------- 
# Output in JSON format for Waybar Module custom-updates
# ----------------------------------------------------- 

css_class="green"
if [ "$cpu" -lt 10 ]; then
    cpu="0$cpu"
fi

if [ "$cpu" -gt $threshhold_yellow ]; then
    css_class="yellow"
fi

if [ "$cpu" -gt $threshhold_red ]; then
    css_class="red"
fi

printf '{"text": "%s", "alt": "%s", "tooltip": "CPU Usage: %s", "class": "%s"}' "$cpu" "$cpu" "$cpu" "$css_class"
