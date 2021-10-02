#!/bin/sh

# PCP packages ..
yes | sudo apt install gawk chrpath debhelper dh-python python3-all python3-dev
yes | sudo apt install python3-all-dev libdbd-pg-perl libclass-dbi-perl zlib1g-dev pylint mandoc
yes | sudo apt install cppcheck libuv1-dev liblzma-dev libsasl2-dev libsystemd-dev libibumad-dev
yes | sudo apt install libibmad-dev libavahi-common-dev libpfm4-dev libreadline-dev
yes | sudo apt install python3-json-pointer python3-setuptools python3-libvirt python3-lxml
yes | sudo apt install python3-prometheus-client python3-elasticsearch python3-openpyxl python3-bpfcc
yes | sudo apt install bpftrace python3-psycopg2 libextutils-autoinstall-perl libyaml-libyaml-perl
yes | sudo apt install libxml-libxml-perl libxml-tokeparser-perl libfile-slurp-perl
yes | sudo apt install liblist-moreutils-perl librrds-perl libspreadsheet-read-perl
yes | sudo apt install libspreadsheet-writeexcel-perl libspreadsheet-readsxc-perl
yes | sudo apt install libspreadsheet-xlsx-perl libtext-csv-xs-perl libjson-perl libnet-snmp-perl
yes | sudo apt install sysstat socat nmap curl valgrind bsd-mailx apache2-bin unbound libdbd-mysql-perl
yes | sudo apt install memcached zabbix-agent postgresql-client-common gfs2-utils qtchooser qtchooser
yes | sudo apt install libqt5svg5-dev libsoqt520-dev libcoin-dev libsoqt520-dev python2-dev
yes | sudo apt install libpython3-dev libnspr4-dev libnss3-dev libnss3-tools libssl-dev sasl2-bin
yes | sudo apt install systemtap-sdt-dev smartmontools auditd lm-sensors xfsprogs
yes | sudo apt install openjdk-11-jre-headless redis-server redis-tools redis-redisearch libvirt-daemon
yes | sudo apt install libvirt-daemon-system libdevmapper-dev net-tools mariadb-client-core-10.3
yes | sudo apt install docker.io feh most ctags fzf fish ripgrep bear libsecret-1-0 libsecret-1-dev
yes | sudo apt install clangd ccls clang ack tig silversearcher-ag bat weechat iwyu astyle cmake
yes | sudo apt install doxygen neovim brightnessctl cmdtest terminator rofi i3-wm i3lock newsboat xclip
yes | sudo apt install graphviz git-email kdiff3 neomutt tree asciinema bison flex

yes | sudo snap install vlc
yes | sudo snap install ripgrep --classic
yes | sudo snap install telegram-desktop
yes | sudo snap install slack --classic

# {{{ install i3-gaps
sudo add-apt-repository ppa:regolith-linux/release
sudo apt update
sudo apt install i3-gaps
# }}}

# {{{ Installing Brave on Linux
yes | sudo apt install apt-transport-https curl
sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
sudo apt update
yes | sudo apt install brave-browser
# }}}
