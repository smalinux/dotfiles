# CapLK is a useless key in a great location

# Now: I use gnome-tweak-tool for maping keys..
# later I will make my own systemd unit:  https://unix.stackexchange.com/a/626970

# KeyTweak windows app for maping CapLK key: https://vim.fandom.com/wiki/Map_caps_lock_to_escape_in_Windows

# Later: try to make j & k keybindings faster : https://youtu.be/d8XtNXutVto?t=492


# Setup Neovim
mkdir ~/.config/nvim/
touch ~/.config/nvim/init.vim

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

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.bashrc ~/.bashrc
ln -sf ~/dotfiles/update.sh ~/update.sh
ln -sf ~/dotfiles/.Xmodmap ~/.Xmodmap
ln -sf ~/dotfiles/init.vim ~/.config/nvim/init.vim
ln -sf ~/dotfiles/.tigrc ~/.tigrc
sudo ln -sf ~/dotfiles/soh /usr/share/X11/xkb/symbols/soh
ln -sf ~/dotfiles/keys.sh ~/keys.sh

# install Tabular
cd ~
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone git://github.com/godlygeek/tabular.git

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

# tweaks
./~/dotfiles/tweaks.sh

" change this maximum screencast length to a different value
gsettings set org.gnome.settings-daemon.plugins.media-keys max-screencast-length 60000

# take keybindings of "less" and but them into "most"
# reference: https://unix.stackexchange.com/a/271252
cp /usr/share/doc/most/lesskeys.rc ~/.mostrc

# rm passwd of login.keyring https://askubuntu.com/a/65294
rm ~/.local/share/keyrings/login.keyring


echo "that's it!"
