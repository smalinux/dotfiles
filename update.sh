#!bin/sh

# Update my backup fedora packages list ...
sh ~/dotfiles/scripts/get-all-fedora-installed-packages.sh

# Push latest version of ~/dotfile to GitHub
cd ~/dotfiles/
git add .
git commit -m "Update"
git push origin master
# EOF

# what
cd /home/smalinux/what-I-learned-today
git push

cd /home/smalinux/gittutorial
git push

cd /home/smalinux/my-modules
git push

cd /home/smalinux/linux_hacking
git push

cd /home/smalinux/swm
git push


