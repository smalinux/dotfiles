# Master tools: remember!!
yes | sudo apt-get install git # git clone https://github.com/smalinux/dotfiles.git
# run command bash dotfiles.sh

# Basic sys libs
##########
yes | sudo apt-get install build-essential gcc make xorg xserver-xorg \
	linux-headers-4.19.0-10-all-i386 firmware-linux-free mesa-utils wget\
       	curl i3lock imagemagick feh fonts-font-awesome libx11-dev\
	libxft-dev vim  curl mpv youtube-dl tree\
	zathura

# wifi hotspot utils


# My Tools
##########

# Dependencies
##########
# suckless depends
yes | sudo apt-get install libxft-dev libxinerama-dev
# install dwm
yes | sudo apt-get install dwm



# Download my main tools

# 1- suckless
mkdir ~/suckless && mkdir ~/bin/
git clone git://git.suckless.org/dwm ~/suckless/dwm
git clone git://git.suckless.org/st ~/suckless/st
cd suxkless/dwm && make clean install
cd suxkless/st && make clean install
cd ~
ln -sf ~/suckless/dwm ~/bin/dwm
ln -sf ~/suckless/st ~/bin/st

echo "exec dwm" > ~/.xinitrc
