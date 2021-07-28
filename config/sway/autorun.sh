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
run pdfsort
run lxsession
run thunar --daemon
run ~/.config/sway/inactive-windows-transparency.py
brightnessctl set 30%
setxkbmap -option caps:escape
