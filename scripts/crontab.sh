#!/usr/bin/bash

pushd ~

   #cd /src/pwn.college/ && make push
   #cd /src/problem_solving/ && make push
   #cd /src/urls/ && make push
   #cd /home/smalinux/python/ && make push
   #cd /src/scripts/ && make push # rand python scripts
   #cd /home/smalinux/web_scraping/ && make push
   #cd /home/smalinux/data_science/ && make push
   #cd /src/sc-backup/ && make push
   cd /home/smalinux/docs/ && make push # Update my docs repos (Obsidian) every 3 hours
   #cd /src/c_/ && make push #FIXME: Cleanup: Add this repo to Obsidian
   cd /home/smalinux/.config/fluent-reader && make push

   cd /src/smalinux.github.io/ && make push
   cd /src/md/ && make push

   cd /src/barebox-cfg/ && make push
   cd /src/linux-cfg/ && make -f make.sh push
   cd /src/buildroot-cfg/ && make push


popd
