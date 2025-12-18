#!/bin/bash

# 1- edit the number of HEAD~x
# 2- add CC as you want

git send-email \
    --cc='sohaib.amhmd@gmail.com' \
    --cc-cmd='/src/acme-perf/scripts/get_maintainer.pl -norolestats' \
    HEAD~1

