source /usr/share/defaults/etc/profile

. ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1

#-------------------
# Personnal Aliases
#-------------------
alias ..='cd ..'
alias ok="ping google.com"

#-------------------
# Personnal Functions
#-------------------


# Usage: extract <file>
# Description: extracts archived files
# Credit: http://nparikh.org/notes/zshrc.txt
extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)  tar -jxvf "$1"                        ;;
      *.tar.gz)   tar -zxvf "$1"                        ;;
      *.bz2)      bunzip2 "$1"                          ;;
      *.gz)       gunzip "$1"                           ;;
      *.tar)      tar -xvf "$1"                         ;;
      *.tbz2)     tar -jxvf "$1"                        ;;
      *.tgz)      tar -zxvf "$1"                        ;;
      *.zip)      unzip "$1"                            ;;
      *.ZIP)      unzip "$1"                            ;;
      *.pax)      cat "$1" | pax -r                     ;;
      *.pax.Z)    uncompress "$1" --stdout | pax -r     ;;
      *.Z)        uncompress "$1"                       ;;
      *) echo "'$1' cannot be extracted/mounted via extract()" ;;
    esac
  else
     echo "'$1' is not a valid file to extract"
  fi
}

#Line wrap on window resize
shopt -s checkwinsize

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

hostStyle=${green};

# Set the terminal title and prompt.
#PS1="\[${userStyle}\]\u"; # username
#PS1+="\[${white}\] @ ";
#PS1+="\[${hostStyle}\]\h \[${reset}\]"; # hosts
#PS1+="\[${dim}\]\w$(__git_ps1 " (%s)") \[${reset}\]"; # Git repository details
#PS1+="\n";
#PS1+="\[${white}\]\$\[${reset}\]"; # `$` (and reset color)

#export PS1;

#PS2="\[${yellow}\]→ \[${reset}\]";
#export PS2;

