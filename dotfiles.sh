# Master tools: remember!!
yes | sudo apt-get install git # git clone https://github.com/smalinux/dotfiles.git
# run command bash dotfiles.sh

# Basic sys libs
##########
yes | sudo apt-get install build-essential gcc make xorg xserver-xorg \
	linux-headers-4.19.0-10-all-i386 firmware-linux-free mesa-utils wget\
       	curl i3lock imagemagick feh fonts-font-awesome libx11-dev\
	libxft-dev vim  curl mpv youtube-dl tree\
	zathura cmake python3-dev libncurses5-dev libncursesw5-dev\
    nnn 

# wifi hotspot utils


# My Tools
##########

# Dependencies
##########
# suckless depends
yes | sudo apt-get install libxft-dev libxinerama-dev
# install dwm
yes | sudo apt-get install dwm



# Linking my most important files ...
ln -sf ~/dotfiles/bookmark.txt ~/bookmark.txt



# Download my main tools

# 1- suckless

# mkdir ~/bin/
# cd ~/dotfiles/suckless/dwm && make && make  install
# cd ~/dotfiles/suckless/st && make && make install
cd ~
ln -sf ~/dotfiles/suckless/dwm ~/bin/dwm
ln -sf ~/dotfiles/suckless/st ~/bin/st
echo "exec dwm" > ~/.xinitrc
ln -sf ~/dotfiles/suckless/dmenu/dmenu ~/bin/dmenu
ln -sf ~/dotfiles/suckless/dmenu/dmenu_run ~/bin/dmenu_run
ln -sf ~/dotfiles/suckless/dmenu/dmenu_path ~/bin/dmenu_path
ln -sf ~/dotfiles/suckless/dmenu/stest ~/bin/stest

########### ~/.vimrc
cd ~
ln -sf ~/dotfiles/.vimrc ~/.vimrc

########### ~/.bashrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc

# install vundleVim plugin manager
mkdir -p ~/.vim/bundle/Vundle.vim/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall

### bla bla bla

















