# {{{ Setup i3
echo "dbus_enable=\"YES\"" >> /etc/rc.conf
echo "hald_enable=\"YES\"" >> /etc/rc.conf
echo "exec /usr/local/bin/i3" > ~/.xinitrc
#shutdown -r now
#startx
# }}}
