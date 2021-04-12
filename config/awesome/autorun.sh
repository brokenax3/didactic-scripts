#!/usr/bin/env bash

# Autostart Applications
function run {
  if ! pgrep -f $1 ;
  then
    $@&
  fi
}

run xrandr --output HDMI-0 --primary --auto --left-of eDP-1-1
run setxkbmap -option caps:escape
run nm-applet
run blueman-applet
run pdfsort
run lxsession
