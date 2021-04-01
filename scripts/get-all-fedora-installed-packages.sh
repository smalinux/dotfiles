#!/bin/sh
# Google: Linux Get List of Installed Software for Reinstallation / Restore All the Software Programs
rpm -qa --qf "%{NAME}\n" | sort > ~/dotfiles/fedora.log
