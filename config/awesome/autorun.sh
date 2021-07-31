#!/usr/bin/env bash

# Autostart Applications
function run {
    if ! pgrep -f $1 ;
    then
        $@&
    fi
}

run xss-lock --transfer-sleep-lock -- locker --nofork
run displayset
run setxkbmap -option caps:escape
run nm-applet
run blueman-applet
run picom -b
run pdfsort
run lxsession
run xfce4-clipman
brightnessctl set 25%
