# Master tools: remember!!
sudo dnf install git # git clone https://github.com/smalinux/dotfiles.git
# run command bash dotfiles.sh

# Basic sys libs
##########


# basic sys utilities
##########
sudo dnf install git vim Xorg wget curl i3lock ImageMagick \
	feh 

# My Tools
##########

# Dependencies
##########
# suckless depends
sudo dnf install libXft libXinerama libX11
# install dwm
sudo dnf install dwm



# Download my main tools

# 1- suckless
mkdir ~/suckless && mkdir ~/bin/
git clone git://git.suckless.org/dwm ~/suckless/
git clone git://git.suckless.org/st ~/suckless/
cd suxkless/dwm && make
cd suxkless/st && make
cd ~
ln -sf ~/suckless/dwm ~/bin/dwm
ln -sf ~/suckless/st ~/bin/st

cat "exec dwm" > ~/.xinitrc
