#!/bin/bash
# Google: Linux Get List of Installed Software for Reinstallation / Restore All the Software Programs
sudo yum -y install $(cat ~/dotfiles/fedora.log)
sudo yum update
