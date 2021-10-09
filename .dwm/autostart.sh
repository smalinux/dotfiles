#!/bin/bash

# compton
compton &

# add arabic keyboeard layout
setxkbmap -layout us,ar
setxkbmap -option 'grp:win_space_toggle'

# caps lock <-> esc
setxkbmap -option caps:swapescape

# wallpaper
feh --bg-fill --randomize https://unsplash.it/1920/1080?random
