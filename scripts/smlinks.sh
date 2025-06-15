#!/bin/bash

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.emacs ~/.emacs
ln -sf ~/dotfiles/.strc ~/.strc
ln -sf ~/dotfiles/i3/ ~/.config/
ln -sf ~/dotfiles/terminator/ ~/.config/
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/.bash_aliases ~/.bash_aliases
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/scripts/update.sh ~/update.sh
ln -sf ~/dotfiles/.Xmodmap ~/.Xmodmap
mkdir -p /home/smalinux/.config/makeshift
ln -sf /home/smalinux/dotfiles/makeshift/* ~/.config/makeshift/
ln -sf ~/dotfiles/.tigrc ~/.tigrc
ln -sf ~/dotfiles/.dwm ~/
sudo ln -sf ~/dotfiles/soh /usr/share/X11/xkb/symbols/soh
sudo ln -sf ~/dotfiles/xsessions/dwm.desktop /usr/share/xsessions/dwm.desktop
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.profile ~/.profile
# SSH
ln -sf ~/dotfiles/.ssh/config ~/.ssh/config

# {{{ my scripts
sudo ln -sf ~/dotfiles/scripts/* /usr/bin/
# }}}

# mpv
ln -sf ~/dotfiles/mpv.conf ~/.config/mpv/mpv.conf

# nvim
mkdir -p /home/smalinux/.config/nvim
ln -sf /home/smalinux/dotfiles/nvim/* ~/.config/nvim/
