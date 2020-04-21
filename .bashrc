# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return ;;
esac

# Keep around 32K lines of history in file
HISTFILESIZE=$((1 << 15))

# Ignore duplicate commands and commands that start with a space
HISTCONTROL=ignoreboth

# Keep the times of the commands in history
HISTTIMEFORMAT='%F %T  '

# Update LINES and COLUMNS after each command if necessary
shopt -s checkwinsize
# Put multi-line commands into one history entry
shopt -s cmdhist
# Append history to $HISTFILE rather than overwriting it
shopt -s histappend

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# ---------------------------------------------------------------------
# Colors (man console_codes.4)
# ---------------------------------------------------------------------
reset='\e[0m';
bold='\e[1m';
dim='\e[2m';
black='\e[30m';
red='\e[31m';
green='\e[32m';
yellow='\e[33m';
blue='\e[34m';
magenta='\e[35m';
cyan='\e[36m';
white='\e[37m';

# ---------------------------------------------------------------------
# PROMPT
# ---------------------------------------------------------------------
# user@host:dir $
# PS1='\u@\h:\[e[32m\]\w\[\e[m\] \$ '
PS1="\u@\h:\[\e[36m\]\w\[\e[m\] \\$ "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;33:note=01;36:caret=01;32:locus=01:quote=01'

# ---------------------------------------------------------------------
# ALIASES
# ---------------------------------------------------------------------
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
