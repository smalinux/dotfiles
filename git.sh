#!/bin/bash

# I uses also bash alias!
# u can find them in ~/.bashrc
#$ statpatch	- stat me what the patch will change
#$ checkpatch	- check { make a useful comment her! }
#$ applypatch	- apply the patch to ,,,
#$ getpatch 	- make patch from last commit

#$ git grep --files-with-match <pattern>
#	I love this. list all filenames only that match this "pattern"

git config --global user.name "Sohaib Mohammed"
git config --global user.email sohaibfacebook396@gmail.com
git config --global core.editor vim
git config --global alias.g 'log --oneline --decorate --graph --all'

#$ show		- How to see the command attached to a bash alias?
#		- see: https://askubuntu.com/a/103524
