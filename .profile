if [[ $(tty) = /dev/tty4 ]]; then
	    exec startx &> ~/.xsession-errors
fi
