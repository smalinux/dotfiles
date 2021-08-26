#!/bin/sh

# PCP packages ..
yes | sudo apt install gawk chrpath debhelper dh-python python3-all python3-dev python3-all-dev libdbd-pg-perl libclass-dbi-perl zlib1g-dev pylint mandoc cppcheck libuv1-dev liblzma-dev libsasl2-dev libsystemd-dev libibumad-dev libibmad-dev libavahi-common-dev libpfm4-dev libreadline-dev python3-json-pointer python3-setuptools python3-libvirt python3-lxml python3-prometheus-client python3-elasticsearch python3-openpyxl python3-bpfcc bpftrace python3-psycopg2 libextutils-autoinstall-perl libyaml-libyaml-perl libxml-libxml-perl libxml-tokeparser-perl libfile-slurp-perl liblist-moreutils-perl librrds-perl libspreadsheet-read-perl libspreadsheet-writeexcel-perl libspreadsheet-readsxc-perl libspreadsheet-xlsx-perl libtext-csv-xs-perl libjson-perl libnet-snmp-perl sysstat socat nmap curl valgrind bsd-mailx apache2-bin unbound libdbd-mysql-perl memcached zabbix-agent postgresql-client-common gfs2-utils qtchooser qtchooser libqt5svg5-dev libsoqt520-dev libcoin-dev libsoqt520-dev python2-dev libpython3-dev libnspr4-dev libnss3-dev libnss3-tools libssl-dev sasl2-bin systemtap-sdt-dev smartmontools auditd lm-sensors xfsprogs openjdk-11-jre-headless redis-server redis-tools redis-redisearch libvirt-daemon libvirt-daemon-system libdevmapper-dev net-tools mariadb-client-core-10.3 docker.io

yes | sudo apt install most ctags fzf fish ripgrep bear libsecret-1-0 libsecret-1-dev clangd ccls clang ack tig \
   silversearcher-ag bat weechat

yes | sudo snap install slack --classic

yes | sudo apt install iwyu astyle cmake doxygen

yes | sudo snap install vlc
