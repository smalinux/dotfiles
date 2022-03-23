#!/bin/python3
# Download All My Cutest GitHub Repos gists Ever!


import os
# Define your repo list
list = open("/home/smalinux/dotfiles/db/repos.txt").readlines()

#Loop it through repo's list
for repo in list:
    #Clone the each repo using ssh git clone command in most secure way
    cmd = "git clone {}".format(repo)
    print("Starting to clone {}".format(repo))
    os.system(cmd)
    print("Finshed cloning {}".format(repo))
    print("#####################################")
    print("")
