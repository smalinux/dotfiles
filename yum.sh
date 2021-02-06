#!/bin/bash

yes | sudo yum install qemu nasm libmpc-devel cmake ack vim

# Start PCP preformance Copilot
# As you see, PCP my be blooted. 
# please don't depend on this packages of ever.
# depend on istractions on GitHub: https://github.com/performancecopilot/pcp/blob/master/INSTALL.md
# I wrote them for quick start & backup reasons. [NOW: 15/1/2021]
yes | sudo yum install mesa-libGL-devel flex-devel bison-devel qt-devel ragel pylint mandoc cppcheck libuv-devel libvarlink-devel rdma-core-devel infiniband-diags-devel avahi-devel libpfm-devel rpm-devel readline-devel python3-jsonpointer python3-rtslib libvirt-python3 python3-prometheus_client python3-elasticsearch python3-openpyxl python3-bcc bpftrace python3-psycopg2 python3-pyodbc perl-File-Slurp rrdtool-perl socat nmap valgrind  mailx 389-ds-base cyrus-sasl-md5 sysstat avahi-tools kubernetes-client perl-DBD-mysql memcached zabbix-agent mysql postgresql gfs2-utils docker qtchooser qt5-qtbase-devel qtchooser qt5-qtsvg-devel SoQt-devel Coin4-devel SoQt-devel setools-console selinux-policy-devel smartmontools lm_sensors redis RediSearch device-mapper-devel chan-devel HdrHistogram_c-devel postfix-perl-scripts python2-setuptools libibmad-devel infiniband-diags-devel libibmad-devel perl-YAML-LibYAML perl-XML-TokeParser cpan perl-Spreadsheet-XLSX perl-Net-SNMP RediSearch
infiniband-diags-devel
# END PCP preformance Copilot

yes | su -c "yum install gparted"
yes | sudo dnf install gcc make bison openssl-devel elfutils-libelf-devel snapd
sudo ln -s /var/lib/snapd/snap /snap
yes | sudo dnf install fedpkg fedora-packager rpmdevtools pesign most git-credential-libsecret 
yes | sudo yum group install "Development Tools"
yes | sudo yum group install fzf bat the_silver_searcher ripgrep
yes | sudo yum install bison openssl-devel global zathura
yes | yum install kernel-headers kernel-devel SDL2-devel qemu-user strace
yes | sudo dnf install module-build-service fedpkg R-R.cache discord
yes | yum install grubby libusb-devel make automake gcc gcc-c++ kernel-devel
yes | sudo yum install ctags indent xchm cscope kscope
yes | sudo yum install libXft-devel ccls
yes | sudo yum install Xorg asciidoctor
yes | sudo yum install ncurses-devel bison flex elfutils-libelf-devel openssl-devel
yes | sudo dnf install ncurses-devel libXt-devel libXaw-devel byacc flex
sudo dnf -y install sublime-merge gcc-c++-arm-linux-gnu
sudo dnf -y install binutils-devel libX11-devel libXft-devel libXinerama-devel nitrogen xorg-x11-xinit-session
sudo dnf -y install xinit mpv nnn zathura-pdf-mupdf youtube-dl
sudo dnf -y install sublime-text gnome-tweak-tool gcc-c++-aarch64-linux-gnu binutils-arm-linux-gnu gcc-arm-linux-gnu glibc-arm-linux-gnu
yes | sudo yum groupinstall 'Development Tools'



sudo yum -y update
# END OF FILE

# iotop
# htop
# ascii
# $epiphany # web browser
# xcalc
# https://snapcraft.io/store

