#!/bin/bash

# I uses also bash alias!
# u can find them in ~/.bashrc
#$ statpatch	- stat me what the patch will change
#$ checkpatch	- check { make a useful comment her! }
#$ applypatch	- apply the patch to ,,,
#$ getpatch 	- make patch from last commit

#$ git grep --files-with-match <pattern>
#	I love this. list all filenames only that match this "pattern"

git config --global user.name "Sohaib"
git config --global user.email sohaib.amhmd@gmail.com
git config --global core.editor vim
git config --global alias.g 'log --oneline --decorate --graph --all'
git config --global pull.rebase true
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
# cache password for fedora: https://stackoverflow.com/a/5343146
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    if [ $OS == "Ubuntu" ]; then
      git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
      git config --global credential.helper store
    elif [ $OS == "Fedora" ]; then
      git config --global credential.helper /usr/libexec/git-core/git-credential-libsecret
    fi
fi

git config --global alias.ack '-c color.grep.linenumber="bold yellow"
 	-c color.grep.filename="bold green"
	-c color.grep.match="reverse yellow"
	grep --break --heading --line-number'
#$ show		- How to see the command attached to a bash alias?
#		- see: https://askubuntu.com/a/103524
