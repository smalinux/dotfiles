#!/bin/bash

pushd ~


   # sorted!
   cd /home/smalinux/docs/ && make push
   cd /home/smalinux/repos/pwn.college/ && make push
   cd /home/smalinux/repos/problem_solving/ && make push
   cd /home/smalinux/repos/urls/ && make push
   cd /home/smalinux/python/ && make push
   cd /home/smalinux/repos/scripts/ && make push # rand python scripts
   # data science section
   cd /home/smalinux/web_scraping/ && make push
   cd /home/smalinux/data_science/ && make push


popd
