#!/bin/bash
# Tested on Ubuntu 21.10


git clone https://github.com/iovisor/bcc.git /src/
pushd /src/
	mkdir bcc/build; cd bcc/build
	cmake ..
	make
	sudo make install
	cmake -DPYTHON_CMD=python3 .. # build python3 binding
	pushd src/python/
	make
	sudo make install
	popd
popd
