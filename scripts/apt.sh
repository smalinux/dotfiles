#!/bin/sh

yes | sudo apt-get install aptitude
# KEEP THE ABOVE LINE FILES ALWAYS
yes | sudo aptitude install gawk chrpath debhelper dh-python python3-all python3-dev
yes | sudo aptitude install python3-all-dev libdbd-pg-perl libclass-dbi-perl zlib1g-dev pylint mandoc
yes | sudo aptitude install cppcheck libuv1-dev liblzma-dev libsasl2-dev libsystemd-dev libibumad-dev
yes | sudo aptitude install libibmad-dev libavahi-common-dev libpfm4-dev libreadline-dev
yes | sudo aptitude install python3-json-pointer python3-setuptools python3-libvirt python3-lxml
yes | sudo aptitude install python3-prometheus-client python3-elasticsearch python3-openpyxl python3-bpfcc
yes | sudo aptitude install bpftrace python3-psycopg2 libextutils-autoinstall-perl libyaml-libyaml-perl
yes | sudo aptitude install libxml-libxml-perl libxml-tokeparser-perl libfile-slurp-perl
yes | sudo aptitude install liblist-moreutils-perl librrds-perl libspreadsheet-read-perl
yes | sudo aptitude install libspreadsheet-writeexcel-perl libspreadsheet-readsxc-perl
yes | sudo aptitude install libspreadsheet-xlsx-perl libtext-csv-xs-perl libjson-perl libnet-snmp-perl
yes | sudo aptitude install sysstat socat nmap curl valgrind apache2-bin unbound libdbd-mysql-perl
yes | sudo aptitude install memcached zabbix-agent postgresql-client-common gfs2-utils qtchooser qtchooser
yes | sudo aptitude install libqt5svg5-dev libsoqt520-dev libcoin-dev libsoqt520-dev python2-dev
yes | sudo aptitude install libpython3-dev libnspr4-dev libnss3-dev libnss3-tools libssl-dev sasl2-bin
yes | sudo aptitude install systemtap-sdt-dev smartmontools auditd lm-sensors xfsprogs
yes | sudo aptitude install openjdk-11-jre-headless redis-server redis-tools redis-redisearch libvirt-daemon
yes | sudo aptitude install libvirt-daemon-system libdevmapper-dev net-tools mariadb-client-core-10.3
yes | sudo aptitude install docker.io feh most fish ripgrep bear libsecret-1-0 libsecret-1-dev
yes | sudo aptitude install clangd ccls clang ack tig silversearcher-ag bat weechat iwyu astyle cmake
yes | sudo aptitude install doxygen neovim brightnessctl cmdtest terminator rofi i3-wm i3lock xclip
yes | sudo aptitude install graphviz git-email kdiff3 neomutt tree asciinema bison flex
yes | sudo aptitude install simplescreenrecorder compton libxft-dev dwarves
yes | sudo aptitude install apt-file # wow https://askubuntu.com/a/655194
yes | sudo aptitude install fonts-symbola vim-gtk3 patchutils nnn pip
yes | sudo apt install suckless-tools xss-lock i3lock
yes | sudo apt install pulseaudio-utils
yes | sudo apt install pandoc
yes | sudo apt install libtinfo-dev libncurses5-dev






# Misc
###############################################################################
yes | sudo apt install zoxide # Autojump-like app, smart cd command
yes | sudo apt install calc   # calculator
yes | sudo apt install youtube-dl
yes | sudo snap install spotify



# perf
###############################################################################
yes | sudo aptitude install linux-tools-`uname -r` # FIXME this line anybe not not useful for you!
yes | sudo aptitude install linux-tools-common linux-tools-generic libdw-dev libcap-dev
yes | sudo aptitude install libnuma-dev binutils-dev libbabeltrace-dev
yes | sudo aptitude install libiberty-dev
yes | sudo aptitude install libbfd-dev libperl-dev libzstd-dev libunwind-dev
yes | sudo aptitude install asciidoc libgtk2.0-dev libslang2-dev
yes | sudo apt install fd-find
yes | sudo apt install mpv
yes | sudo apt install tmux
yes | sudo apt install clang
yes | sudo apt install unrar # unzip rar file - this app really saved my life
yes | sudo apt install bear
yes | sudo apt install xkbset
yes | sudo apt install universal-ctags
yes | sudo apt install openssh-server
yes | sudo apt install gnome-screenshot

# BCC
###############################################################################
yes | sudo apt install libelf-dev
yes | sudo apt install libclang-dev
yes | sudo apt install netperf
yes | sudo apt install iperf
yes | sudo apt install arping
yes | sudo apt-get install llvm

# bpf
###############################################################################
yes | sudo aptitude install bpfcc-tools

# zsh
###############################################################################
yes | sudo aptitude install zsh zsh-syntax-highlighting

# lstopo
###############################################################################
yes | sudo aptitude install hwloc

# snap
###############################################################################
yes | sudo snap install vlc
yes | sudo snap install ripgrep --classic
yes | sudo snap install telegram-desktop
yes | sudo snap install slack --classic
yes | sudo snap install sublime-text --classic


# {{{ obs-studio
yes | sudo add-apt-repository ppa:obsproject/obs-studio
yes | sudo apt-get update
yes | sudo apt-get install obs-studio
# }}}

# {{{ install i3-gaps
sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
yes | sudo apt install i3-gaps
# }}}

# {{{ Installing Brave on Linux
yes | sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
yes | sudo apt install brave-browser
# }}}



pip3 install --user fzf-dirhistory --break-system-packages

