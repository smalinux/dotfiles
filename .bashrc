


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
HISTSIZE=100000
HISTFILESIZE=20000

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


if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
    VER=$VERSION_ID
    if [ "$OS" = "Ubuntu" ]; then
        if [ "$color_prompt" = yes ]; then
            PS1='Ubuntu\[\033[01;31m\]@\[\033[00m\]\[\033[01;34m\]\W\[\033[00m\] $ '
            #PS1="$(echo -e '\033[031m${USER}\033[033m:${PWD}\033[0m\n$ ')"
        else
            PS1='${debian_chroot:+($debian_chroot)}\u@\h \W\<3 '
            #PS1="$(echo -e '\033[031m${USER}\033[033m:${PWD}\033[0m\n$ ')"
        fi
    elif [ "$OS" = "Fedora Linux" ]; then
        if [ "$color_prompt" = yes ]; then
            PS1='Fedora\[\033[01;31m\]@\[\033[00m\]\[\033[01;34m\]\W\[\033[00m\] $ '
            #PS1="$(echo -e '\033[031m${USER}\033[033m:${PWD}\033[0m\n$ ')"
        else
            PS1='${debian_chroot:+($debian_chroot)}\u@\h \W\<3 '
            #PS1="$(echo -e '\033[031m${USER}\033[033m:${PWD}\033[0m\n$ ')"
        fi
    fi
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

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

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

# vi-mode in bash
set -o vi
# powerline for bash
# Add this to your PATH if it’s not already declared
export PATH=$PATH:$HOME/.local/bin
export VISUAL=/usr/bin/vim
export EDITOR=/usr/bin/nvim
export BROWSER=/usr/bin/brave-browser
# https://unix.stackexchange.com/a/104101/265591
# clear screen: Ctrl+l
bind -m vi-command 'Control-l: clear-screen'
bind -m vi-insert 'Control-l: clear-screen'
#
bind -m vi-insert 'Control-p: previous-history'
bind -m vi-insert 'Control-n: next-history'
# end: vi-mode

# https://askubuntu.com/a/1098331
LC_TIME=en_US.utf8

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# --- tmux ---
# This snippet allow me to login into tmux by default, and prevent tmux from
# make new sessions after bootup.
#
# tmux session exist? if yes = attach, no (after boot) = then exec tmux and
# tmux-resurrect plugin will take care of the restore & attach
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  cmdout=$(exec tmux attach 2>&1)
  if (($?)); then
	exec tmux
  fi
fi

xset r rate 300 50
xset s off
xset -dpms

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/smalinux/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/smalinux/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/smalinux/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/smalinux/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# {{{ zoxide

#  https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init bash)"

# }}}

# {{{ fzfdirhist
PROMPT_COMMAND='python3 -m fzfdirhist log "$(pwd)"'

fdh() {
  local dir=$(python3 -m fzfdirhist show | fzf --height=40% --reverse +m)
  cd "$dir"
}

bind '"\C-e": "\C-k\C-u fdh\n"'
# }}}

# Prevent conda from auto-activating the base environment by default
#$ conda config --set auto_activate false

