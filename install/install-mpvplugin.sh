#!/bin/bash

# https://github.com/smalinux/mpv-youtube-quality

pushd /tmp
	git clone https://github.com/smalinux/mpv-youtube-quality
	cd mpv-youtube-quality
	mkdir -p ~/.config/mpv/scripts/
	mkdir -p ~/.config/mpv/scripts-opts/
	cp youtube-quality.lua ~/.config/mpv/scripts
	cp youtube-quality.conf ~/.config/mpv/script-opts
	echo "OK!"
popd
