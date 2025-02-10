# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=always'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# package manager alieases
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    if [ "$OS" = "Ubuntu" ]; then
      alias i='sudo aptitude install'
      alias s='apt search'
      alias r='sudo apt remove'
    elif [ "$OS" = "Fedora Linux" ]; then
      alias i='sudo yum install'
      alias s='yum search'
      alias r='sudo yum remove'
    fi
fi

# $ f
# $ F
alias f='sudo find . -name'
alias F='sudo find / -name'
alias ll='ls -la'
alias x='~/dotfiles/scripts/extract' # extract any kind of archive
alias make='bear -- make' # because of coc.vim
alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'
# Record screencast
alias record='simplescreenrecorder'

alias map='xmodmap dotfiles/.Xmodmap'
alias mapo='xmodmap dotfiles/xmodmap_original'
alias logout="gnome-session-quit --logout"
alias ,="pwd"

# Swap $man <-> $Vim as a PAGER without changing $PAGER var ;)
# also you could use just q for quit.
#alias man='bash -c '\''vim +Man\ $0 +wincmd\ o'\'''


alias vim="nvim"

# How can I copy the output of a command directly into my clipboard?
# https://stackoverflow.com/a/5130969/5688267
# ls | cc
# vv
alias "cc=xclip -selection clipboard"
alias "vv=xclip -o -selection clipboard"

# {{{ copy vimspector.json to current dir
alias vimspector="cp ~/dotfiles/vimspector/.vimspector.json ."
# }}} FIXME: Bad idea. make this automatic, you don't have to type this thing
# everytime.

# Power aliases
alias R='yes | rm -r'
alias cp='cp -r'
alias n='ranger'
alias mutt='neomutt'
alias strc='xrdb ~/.strc' # Update strc
alias t='date +"%n%w) %A%n%d/%m/%Y%n%X%n"'

# {{{ Linux Kernel

# $ send_patch_next 0001-your-patch-name.patch # that's it ;)
send_patch_next() {
    git send-email --cc sohaib.amhmd@gmail.com --cc-cmd='/home/smalinux/linux-next/scripts/get_maintainer.pl -norolestats' "$1"
}

alias checkpatch='/home/smalinux/linux-next/scripts/checkpatch.pl'

# }}}

# $ aptfile btf.h
aptfile() {
	apt-file search "$1" | grep "$1"
}

# To search for a specific tag and open Vim to its definition, run the following
# command in your shell:
# Run Ctags recursively over the entire kernel to generate the tags file. For
# Linux 2.6.13, this should only take a minute or so:
alias ctags='ctags -R *'

# copy any line (ex: link) into any file
# $ fc dotfiles
fc() {
	cat "$1" | fzf --reverse | xclip -selection clipboard
}

# https://github.com/jgreco/mpv-youtube-quality
alias music="mpv --no-video --loop"

# {{{ git aliases
alias statpatch='git apply --stat'
alias checkpatch='git apply --check'
alias applypatch='patch -p1 < '
# f = format p = patch
alias git-fp='git format-patch --base=auto --cover-letter'  # ex$ git format-patch -1 HEAD    # where 1 == number of commit

# ex$ git format-patch -1 HEAD    # where 1 == number of commit
function git-make-patch() {
   git format-patch -$1 HEAD
}
# DONT USE THIS, this just a reference, The canonical git-send-email(1) args
alias git-se='git send-email --base=auto --cover-letter'
# }}}

ss() {
   brave-browser https://www.linkedin.com/in/smalinux/
   #brave-browser https://www.instagram.com/smalinux/
   #brave-browser https://soundcloud.com/smalinux
   #brave-browser https://github.com/smalinux
   #brave-browser https://web.whatsapp.com
   #brave-browser https://twitter.com
   #brave-browser https://facebook.com
}

# $ b google.com
function b() {
   brave-browser --app="https://$1"
}

alias linkedin='brave-browser --app=https://www.linkedin.com/in/smalinux/'
alias insta='brave-browser --app=https://www.instagram.com/smalinux/'
alias soundcloud='brave-browser --app=https://soundcloud.com/smalinux'
alias github='brave-browser --app=https://github.com/smalinux'
alias whatsapp='brave-browser --app=https://web.whatsapp.com'
alias twitter='brave-browser --app=https://twitter.com'
alias facebook='brave-browser --app=https://facebook.com'
alias gmail='brave-browser --app=https://gmail.com'
alias cal='brave-browser --app=https://calendar.google.com/calendar/u/0/r/week' # Calendar
alias keep='brave-browser --app=https://keep.google.com/u/0/?pli=1#home' # Google Keep
alias c='calc' # sudo apt install calc

# I got this error when I invoked gnome-control-center:
# Running gnome-control-center is only supported under GNOME and Unity, exiting
# And here is the solution:
# https://discourse.gnome.org/t/gnome-control-center-outside-of-gnome/15771
alias gnome-control-center='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'

l() {
   sudo brightnessctl -q set $1%
}
