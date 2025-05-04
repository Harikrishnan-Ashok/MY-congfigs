#!/bin/bash
#script to kill or launch waybar as needed



if pgrep -x "waybar" > /dev/null
then
    pkill -x waybar
else
    waybar &
fi
