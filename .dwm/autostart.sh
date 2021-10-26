#!/bin/bash

# compton
compton &

# caps lock <-> esc
setxkbmap -option caps:swapescape

# add arabic keyboeard layout
setxkbmap -layout us,ar
setxkbmap -option 'grp:ctrls_toggle'


# wallpaper
feh --bg-fill --randomize https://unsplash.it/1920/1080?random

# make j & k keybindings faster : https://youtu.be/d8XtNXutVto?t=492
exec_always xset r rate 300 50

xrdb ~/.strc
