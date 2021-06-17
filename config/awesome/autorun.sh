#!/usr/bin/env bash

# Autostart Applications
function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}


# GPUMODE="$(optimus-manager --status | grep "Current GPU mode" | awk '{print $5}')"

# if [[ "$GPUMODE" == "nvidia" ]];then
#     xrandr --output DP-0 --primary --mode 1920x1080 --rate 74.97 --set "Broadcast RGB" "Full" --right-of eDP-1-1
# else
#     xrandr --output DP1 --primary --mode 1920x1080 --rate 74.97 --set "Broadcast RGB" "Full" --right-of eDP1
# fi

xrandr --output DP1 --primary --mode 1920x1080 --rate 74.97 --set "Broadcast RGB" "Full" --right-of eDP1
# run xrandr --output HDMI-0 --primary --auto --right-of eDP-1-1
run setxkbmap -option caps:escape
run nm-applet
run blueman-applet
run picom -b
run pdfsort
run lxsession
run xfce4-clipman
brightnessctl set 30%
