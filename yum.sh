#!/bin/bash

yes | sudo yum install qemu nasm
yes | su -c "yum install gparted"
yes | sudo dnf install gcc make bison openssl-devel elfutils-libelf-devel snapd
sudo ln -s /var/lib/snapd/snap /snap
yes | sudo dnf install fedpkg fedora-packager rpmdevtools pesign
yes | sudo yum group install "Development Tools"
yes | sudo yum install bison openssl-devel global zathura
yes | yum install kernel-headers kernel-devel SDL2-devel qemu-user strace
yes | sudo dnf install module-build-service fedpkg R-R.cache discord
yes | yum install grubby libusb-devel make automake gcc gcc-c++ kernel-devel
yes | sudo yum install ctags indent xchm cscope kscope
yes | sudo yum install libXft-devel
yes | sudo yum install Xorg 
yes | sudo yum install ncurses-devel bison flex elfutils-libelf-devel openssl-devel
yes | sudo dnf install ncurses-devel libXt-devel libXaw-devel byacc flex
sudo dnf -y install sublime-merge gcc-c++-arm-linux-gnu
sudo dnf -y install binutils-devel libX11-devel libXft-devel libXinerama-devel nitrogen xorg-x11-xinit-session
sudo dnf -y install xinit mpv nnn zathura-pdf-mupdf youtube-dl
sudo dnf -y install sublime-text gnome-tweak-tool gcc-c++-aarch64-linux-gnu binutils-arm-linux-gnu gcc-arm-linux-gnu glibc-arm-linux-gnu
sudo yum groupinstall 'Development Tools'



sudo yum -y update
# END OF FILE

# iotop
# htop
# ascii
# $epiphany # web browser
# xcalc
# https://snapcraft.io/store

