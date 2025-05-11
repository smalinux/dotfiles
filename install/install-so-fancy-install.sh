#!/bin/bash
# credit: https://gist.github.com/gmolveau/8fcdb5e953bd6c9dad18ecd39b9718a4

LATEST_VERSION=$(curl -s https://api.github.com/repos/so-fancy/diff-so-fancy/releases/latest | grep -Po '"tag_name": "v\K[^"]*')
sudo curl -L -o /usr/local/bin/diff-so-fancy "https://github.com/so-fancy/diff-so-fancy/releases/download/v${LATEST_VERSION}/diff-so-fancy"
sudo chmod +x /usr/local/bin/diff-so-fancy
