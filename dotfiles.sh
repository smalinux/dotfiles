#!/bin/sh

# fedora yum dependencies
sudo chmod +x ~/dotfiles/yum.sh
sudo sh ~/dotfiles/yum.sh

# .git config
sudo chmod +x ~/dotfiles/git.sh
sh ~/dotfiles/git.sh

# Mute Gnome alerts
gsettings set org.gnome.desktop.sound event-sounds false
cd ~
mkdir bin

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
cd ~/.vim/bundle/youcompleteme && ./install.py --clang-completer && python install.py
### END OF FILE 


# Remove user passwd to speed ur work
# https://www.google.com/search?q=fedora+change+passwd+user+to+empty
echo "========================================================================"
echo "========== IF you want to speed you work >> remove usr passwd =========="
echo "sudo passwd -r root"
echo "sudo passwd -r -f -u smalinux"
echo "========================================================================"
# Fuck off mouse! I will never to back again! I'm vimmer who use GUI
#   with keyboard ONLY!..........
echo "Please if you are moving between pysical an virtul vmware, to this:"
echo "	VMware > edit > preferences > input"
echo "		<check> grap keyboard and mouse on key click"
echo "========================================================================"

# VMware related stuff
sh ~/dotfiles/VMware.sh


echo "ToDO:"
echo "Google: vim youcompleteme linux kernel" # how to use ycm plugin with kernel

" change this maximum screencast length to a different value
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 60000

echo "that's it!"
