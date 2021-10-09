#!/bin/sh
# First of all please, cp all dotfile/.something to ur ~
yes | pkg install most tree atop gcc htop tig neovim p5-ack
yes | pkg install xorg pkgconf
yes | pkg install awesome feh compton devel/bear
yes | pkg install tree bash autoconf autotools devel/ncurses
yes | pkg install node npm ccls
yes | pkg install maim


chsh -s /usr/local/bin/bash
