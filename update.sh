#!bin/sh

# Update my backup fedora packages list ...
sh ~/dotfiles/scripts/get-all-fedora-installed-packages.sh

# Push latest version of ~/dotfile to GitHub
cd ~/dotfiles/
git add .
git commit -m "Update"
git push origin master
# EOF
