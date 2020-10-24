# …or create a new repository on the command line
#################################################
echo "# lab" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/smalinux/lab.git
git push -u origin main

# …or push an existing repository from the command line
#######################################################
git remote add origin https://github.com/smalinux/lab.git
git branch -M main
git push -u origin main

# …or import code from another repository
#########################################
google ...
