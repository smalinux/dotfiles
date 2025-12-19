# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

#
# Remap keyboard
#------------------------------------------------------------------------------
setxkbmap -layout us,ara
setxkbmap -option 'grp:ctrls_toggle'
#setxkbmap -option caps:swapescape

# no mouse
setxkbmap -option keypad:pointerkeys
xkbset ma 60 10 10 6 2


#
# env vars
#------------------------------------------------------------------------------
export python='/usr/bin/python3'

#
# fzf
#------------------------------------------------------------------------------
export FZF_DEFAULT_COMMAND='fd --type f --color=never --hidden'
export FZF_DEFAULT_OPTS='--no-height --color=bg+:#343d46,gutter:-1,pointer:#ff3c3c,info:#0dbc79,hl:#0dbc79,hl+:#23d18b'

export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :50 {} && wc -l {}' --multi --bind 'enter:execute($EDITOR -p {+})+abort'"

export FZF_ALT_C_COMMAND='fd --type d . --color=never --hidden'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -50'"

export MANPAGER="vi +Man!"
export MANWIDTH=999

# source local settings
if [ -f "$HOME/.bashrc" ] ; then
  source "$HOME/.bashrc"
fi

# I want my HDMI-0 screen to be reversed by default permanently
xrandr --output HDMI-0 --rotate inverted
xrandr --output HDMI-0 --auto --primary

#xrandr --output HDMI-0 --mode 1920x1080 --pos 1920x0
#xrandr --output eDP-1-1 --mode 1920x1080 --pos 0x0
