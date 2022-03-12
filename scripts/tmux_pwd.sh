#!/bin/bash

printf '\033%s\007' $(echo "$1" | awk '{print "~"$1}' | cut -d/ -f-1,4-)
