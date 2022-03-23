#!/bin/bash

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.strc ~/.strc
ln -sf ~/dotfiles/i3/ ~/.config/
ln -sf ~/dotfiles/terminator/ ~/.config/
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/scripts/update.sh ~/update.sh
ln -sf ~/dotfiles/.Xmodmap ~/.Xmodmap
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.dwm ~/
sudo ln -sf ~/dotfiles/soh /usr/share/X11/xkb/symbols/soh
ln -sf ~/dotfiles/coc-settings.json ~/.config/nvim/coc-settings.json
sudo ln -sf ~/dotfiles/xsessions/dwm.desktop /usr/share/xsessions/dwm.desktop
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.profile ~/.profile

# {{{ my scripts
sudo ln -sf ~/dotfiles/scripts/* /usr/bin/
