# ---------------------------------------------------------------------
# ALIASES
# ---------------------------------------------------------------------
alias ..="cd .."

# ---------------------------------------------------------------------
# PATH
# ---------------------------------------------------------------------
# If Ruby exists, we want to have it's bins available
if [[ $(command -v ruby) ]]; then
  gem_dir="$(ruby -e 'print Gem.user_dir')"
  gem_bin_dir="$gem_dir/bin"
  if [[ ! -d "$gem_bin_dir" ]]; then
    echo "Creating $gem_bin_dir"
    mkdir -p "$gem_bin_dir"
  fi

  export GEM_PATH="$gem_dir"
  PATH=$PATH:"$gem_bin_dir"
fi

# How can we miss Rust?
if [[ ! -d "$HOME/.cargo/bin" ]]; then
	mkdir --parents --verbose "$HOME/.cargo/bin"
fi
PATH=$PATH:"$HOME/.cargo/bin"

# The same applies to Yarn
if [[ ! -d "$HOME/.yarn/bin" ]]; then
	mkdir --parents --verbose "$HOME/.yarn/bin"
fi
PATH=$PATH:"$HOME/.yarn/bin"

# ---------------------------------------------------------------------
# FUNCTIONS
# ---------------------------------------------------------------------
# Usage: extract <file>
# Description: Easy file extraction
# Credit: http://nparikh.org/notes/zshrc.txt
extract() {
  case "$1" in
    *.bz2)     bunzip2 "$1"                      ;;
    *.gz)      gunzip "$1"                       ;;
    *.tar)     tar -xvf "$1"                     ;;
    *.tar.bz2) tar -jxvf "$1"                    ;;
    *.tar.gz)  tar -zxvf "$1"                    ;;
    *.tbz2)    tar -jxvf "$1"                    ;;
    *.tgz)     tar -zxvf "$1"                    ;;
    *.pax)     cat "$1" | pax -r                 ;;
    *.pax.Z)   uncompress "$1" --stdout | pax -r ;;
    *.xz)      xz --keep -d "$1"                 ;;
    *.zip)     unzip "$1"                        ;;
    *.Z)       uncompress "$1"                   ;;
    *.ZIP)     unzip "$1"                        ;;
    *) echo "'$1' cannot be extracted via extract()" ;;
  esac
}

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
