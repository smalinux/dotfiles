#!/bin/bash

pushd ~


   # sorted!
   cd /home/smalinux/docs/ && make
   cd /home/smalinux/repos/pwn.college/ && make
   cd /home/smalinux/repos/problem_solving/ && make
   cd /home/smalinux/repos/urls/ && make
   cd /home/smalinux/newsboat/ && make
   cd /home/smalinux/python/ && make
   cd /home/smalinux/repos/web_scraping/ && make push


popd
