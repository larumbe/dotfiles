#! /bin/bash

xrandr --output VGA1 --mode 1440x900
xrandr --output LVDS1 --off
# xrandr --output VGA1 --mode 1024x768
ratpoison -c restart
setxkbmap -layout "es, us, ir"  -variant rus -option "grp:alt_shift_toggle"
xmodmap .xmodmap
## setxkbmap -layout "es, us, ir, ru"  -variant rus -option "grp:alt_caps_toggle"
## ibus-daemon &
## xchat &
## firefox &


