#!/bin/bash

pushd ~
	#git clone https://github.com/performancecopilot/pcp

	#su root
	#groupadd -r pcp
	#useradd -c "Performance Co-Pilot" -g pcp -d /var/lib/pcp -M -r -s /usr/sbin/nologin pcp

	cd pcp

	#qa/admin/check-vm

	./configure --prefix=/usr --libexecdir=/usr/lib --sysconfdir=/etc \
		--localstatedir=/var --with-rcdir=/etc/init.d
	make
	su root
	make install

popd



# sudo make clean
