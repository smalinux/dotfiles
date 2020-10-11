#!/bin/sh

choice=$(echo "Shutdown\nReboot\nExit" | dmenu -i -p "Choose action")

[$choice = ""] && sudo shutdown
[$choice = ""] && sudo reboot
[$choice = ""] && sudo pkill dwm
