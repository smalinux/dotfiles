


# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='sohaib\[\033[01;31m\]@\[\033[00m\]\[\033[01;34m\]\W\[\033[00m\]\<3 '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h \W\<3 '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h \W\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
#alias l='ls -CF'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# {{{ grep color
alias grep='grep --color=always'
# }}}

# $ f
# $ F
alias f='sudo find . -name'
alias F='sudo find / -name'
alias ll='ls -la'
alias x='~/dotfiles/scripts/extract.sh' # extract any kind of archive
# package manager alieases
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    if [ $OS == "Ubuntu" ]; then
      alias i='sudo aptitude install'
      alias s='apt search'
      alias r='sudo apt remove'
    elif [ $OS == "Fedora" ]; then
      alias i='sudo yum install'
      alias s='yum search'
      alias r='sudo yum remove'
    fi
fi


alias ..='cd ..'
alias ...='cd ..; cd ..'
alias ....='cd ..; cd ..; cd ..'

# Record screencast
#@ rpm -Uvh http://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-stable.noarch.rpm
#@ Google: How to Configure Xorg as Default GNOME Session in Fedora
#@ https://fedoraproject.org/wiki/ScreenCasting
alias record='simplescreenrecorder'

alias map='xmodmap dotfiles/.Xmodmap'
alias mapo='xmodmap dotfiles/xmodmap_original'
alias out="gnome-session-quit --logout"

##### git aliases
alias statpatch='git apply --stat'
alias checkpatch='git apply --check'
alias applypatch='patch -p1 < '
alias getpatch='git format-patch'  # ex$ git format-patch -1 HEAD    # where 1 == number of commit

# vi-mode in bash
set -o vi
# powerline for bash
# Add this to your PATH if it’s not already declared
export PATH=$PATH:$HOME/.local/bin
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/vim
export BROWSER=/usr/bin/brave-browser
# https://unix.stackexchange.com/a/104101/265591
# clear screen: Ctrl+l
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
#
bind -m vi-insert 'Control-p: previous-history'
bind -m vi-insert 'Control-n: next-history'
# end: vi-mode

# {{{ https://askubuntu.com/a/1098331
LC_TIME=en_US.utf8
# }}}

# forground command, this very helpful if want to toggle vim background
# https://stackoverflow.com/a/66349559/5688267
bind -x '"\C-f":"stty sane;fg;"'

# Swap $man <-> $Vim as a PAGER without changing $PAGER var ;)
# also you could use just q for quit.
alias man='bash -c '\''vim +Man\ $0 +wincmd\ o'\'''
alias vim="nvim"

#alias vim="nvim"

# LSP
alias lsp_ccls="clang -fsyntax-only -v -xc /dev/null"
alias lsp_make_ccls="cp /home/sohiab/dotfiles/.ccls ."
alias lsp_bear="bear make"
: '
{
"languageserver": {
  "ccls": {
    "command": "ccls",
    "filetypes": ["c"],
    "rootPatterns": [".ccls", "compile_commands.json", ".git/", ".hg/"],
    "initializationOptions": {
        "cache": {
          "directory": "/tmp/ccls"
        }
      }
  }
}
}
'
#source "$HOME/.cargo/env"


# How can I copy the output of a command directly into my clipboard?
# https://stackoverflow.com/a/5130969/5688267
alias "cc=xclip -selection clipboard"
alias "vv=xclip -o -selection clipboard"
# ls | cc
# vv

# {{{ copy vimspector.json to current dir
alias vimspector="cp ~/dotfiles/vimspector/.vimspector.json ."
# }}}

# Power aliases
alias R='yes | rm -r'
alias cp='cp -r'
alias make='bear make' # because of coc.vim
alias nn='newsboat'
alias n='ranger'
alias m='neomutt'
alias strc='xrdb ~/.strc' # Update strc
alias p='perf'
alias time='date +"%w) %A %d/%m/%Y %X"'

# {{{ Linux Kernel

   #$ send_patch_stable 0001-your-patch-name.patch
   # that's it ;)
send_patch_stable() {
    git send-email --cc sohaib.amhmd@gmail.com --cc-cmd='/home/smalinux/linux-stable/scripts/get_maintainer.pl -norolestats' "$1"
}

send_patch_torvalds() {
    git send-email --cc sohaib.amhmd@gmail.com --cc-cmd='/home/smalinux/linux-torvalds/scripts/get_maintainer.pl -norolestats' "$1"
}

send_patch_next() {
    git send-email --cc sohaib.amhmd@gmail.com --cc-cmd='/home/smalinux/linux-next/scripts/get_maintainer.pl -norolestats' "$1"
}


alias checkpatch='/home/smalinux/linux-stable/scripts/checkpatch.pl'

# }}}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# aptfile functions
aptfile() {
	apt-file search "$1" | grep "$1"
}
