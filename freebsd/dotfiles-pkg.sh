# {{{ Setup i3
echo 'dbus_enable="YES"' >> /etc/rc.conf
echo 'hald_enable="YES"' >> /etc/rc.conf
echo 'exec /usr/local/bin/i3' > ~/.xinitrc
#cp ~/dotfiles/i3/config /root/.config/i3/config
wget https://raw.githubusercontent.com/deadesthead/lilrepo/master/config/i3/.i3/config ~/.config/i3/
#shutdown -r now
#startx
# }}}

echo 'sendmail_submit_enable="NO"' >> /etc/rc.conf
echo 'sendmail_outbound_enable="NO"' >> /etc/rc.conf
echo 'sendmail_msp_queue_enable="NO"' >> /etc/rc.conf
