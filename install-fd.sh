#!/bin/bash


FALLBACK_VERSION="8.3.2"

if [ "$1" != "" ]; then
    VERSION="$1"
else
    VERSION=$FALLBACK_VERSION
fi

DEBIAN_PACKAGE=fd_${VERSION}_amd64.deb

# install fd
wget https://github.com/sharkdp/fd/releases/download/v${VERSION}/$DEBIAN_PACKAGE
sudo dpkg -i $DEBIAN_PACKAGE
rm $DEBIAN_PACKAGE

echo
echo '"fd" is now on the path'

