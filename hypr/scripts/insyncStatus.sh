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
# Calculate cpu usage
# ----------------------------------------------------- 

status=$(insync status)
# ----------------------------------------------------- 
# Testing
# ----------------------------------------------------- 

# css_class="green"
# text="R"
# text2="Click to open"
# printf '{"text": "%s", "alt": "%s", "tooltip": "%s", "class": "%s"}' "$text" "$text" "$text2" "$css_class"
# exit

# ----------------------------------------------------- 
# Output in JSON format for Waybar Module Insync Status
# ----------------------------------------------------- 

css_class="green"
text=""
text2="Click to open/hide"

if [ "$status" == "Insync doesn't seem to be running. Start it first." ]; then
    css_class="red"
    text=""
    text2="Click to start"
    #insync start
fi

printf '{"text": "%s", "alt": "%s", "tooltip": "%s", "class": "%s"}' "$text" "$text" "$text2" "$css_class"
