#!/bin/bash
# https://askubuntu.com/questions/363346/how-to-permanently-switch-caps-lock-and-esc#comment523848_365701
yes | sudo apt-get install dconf-tools
dconf write /org/gnome/desktop/input-sources/xkb-options "['caps:escape']"
