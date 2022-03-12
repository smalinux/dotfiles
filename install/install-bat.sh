#!/bin/bash

# remove yourself

FALLBACK_VERSION="0.19.0"

if [ "$1" != "" ]; then
    VERSION="$1"
else
    VERSION=$FALLBACK_VERSION
fi

DEBIAN_PACKAGE=bat_${VERSION}_amd64.deb

# install bat
wget https://github.com/sharkdp/bat/releases/download/v${VERSION}/$DEBIAN_PACKAGE
sudo dpkg -i $DEBIAN_PACKAGE
rm $DEBIAN_PACKAGE

echo
echo '"bat" is now on the path'
