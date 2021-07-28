#!/usr/bin/env bash

# Autostart Applications

# Make sure only one instance is running
function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}

run dunst
run autotiling
run picom -b
run pdfsort
run lxsession
run xfce4-clipman
brightnessctl set 30%
setxkbmap -option caps:escape

# Make sure display is set before restoring wallpaper
displayset && nitrogen --restore
