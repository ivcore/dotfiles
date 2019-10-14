# ---------------------------------------------------------------------
# ALIASES
# ---------------------------------------------------------------------
alias ..="cd .."

# ---------------------------------------------------------------------
# PATH
# ---------------------------------------------------------------------
export PATH=$PATH:"$HOME/bin"

if [[ ! -d "$HOME/.cargo/bin" ]]; then
	mkdir --parents --verbose "$HOME/.cargo/bin"
fi
export PATH=$PATH:"$HOME/.cargo/bin"

if [[ ! -d "$HOME/.yarn/bin" ]]; then
	mkdir --parents --verbose "$HOME/.yarn/bin"
fi
export PATH=$PATH:"$HOME/.yarn/bin"

# Line wrap on window resize.
shopt -s checkwinsize

# ---------------------------------------------------------------------
# Colors
# ---------------------------------------------------------------------
bold='';
dim="\e[2m";
reset="\e[0m";
black="\e[1;30m";
blue="\e[1;34m";
cyan="\e[1;36m";
green="\e[1;32m";
orange="\e[1;33m";
purple="\e[1;35m";
red="\e[1;31m";
violet="\e[1;35m";
white="\e[1;37m";
yellow="\e[1;33m";

[[ -f "$HOME/.extend.bashrc" ]] && . "$HOME/.extend.bashrc"

[[ -r /usr/share/bash-completion/bash_completion ]] && . /usr/share/bash-completion/bash_completion
