#!/bin/bash


pushd /tmp
	git clone https://github.com/smalinux/autojump
	cd autojump
	sudo ./install.py
popd
