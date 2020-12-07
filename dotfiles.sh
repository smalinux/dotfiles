#!/bin/sh

# Mute Gnome alerts
gsettings set org.gnome.desktop.sound event-sounds false

# Linking my most important files ...
ln -sf ~/dotfiles/bookmark.txt ~/bookmark.txt
ln -sf ~/dotfiles/fun.txt ~/fun.txt
ln -sf ~/dotfiles/man.txt ~/man.txt
ln -sf ~/dotfiles/notes.txt ~/notes.txt
ln -sf ~/dotfiles/linux-cute-dever.adoc ~/linux-cute-dever.adoc
ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/update.sh ~/update.sh
ln -sf ~/dotfiles/.Xmodmap ~/.Xmodmap
sudo ln -sf ~/dotfiles/soh /usr/share/X11/xkb/symbols/soh

# Suckless
cd ~
ln -sf ~/dotfiles/suckless/dwm ~/bin/dwm
ln -sf ~/dotfiles/suckless/st ~/bin/st
echo "exec dwm" > ~/.xinitrc
ln -sf ~/dotfiles/suckless/dmenu/dmenu ~/bin/dmenu
ln -sf ~/dotfiles/suckless/dmenu/dmenu_run ~/bin/dmenu_run
ln -sf ~/dotfiles/suckless/dmenu/dmenu_path ~/bin/dmenu_path
ln -sf ~/dotfiles/suckless/dmenu/stest ~/bin/stest

# install vundleVim plugin manager
mkdir -p ~/.vim/bundle/Vundle.vim/
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Installing all vim plugins and quit.
vim +PluginInstall +qall # KEEB THIS LINE ALWAYS LAST LINE !
### END OF FILE 
