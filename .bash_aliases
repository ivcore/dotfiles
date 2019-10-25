# Some useful aliases.
alias h='history'
alias j="jobs -l"
alias ll="ls -l"

#
# Csh compatability:
#
alias unsetenv=unset
function setenv () {
  export $1="$2"
}

# Function which adds an alias to the current shell and to
# the ~/.bash_aliases file.
add-alias ()
{
   local name=$1 value="$2"
   echo alias $name=\'$value\' >>~/.bash_aliases
   eval alias $name=\'$value\'
   alias $name
}

alias ..="cd .."
alias please="sudo "
# Print each PATH entry on a separate line
alias path='echo -e ${PATH//:/\\\n}'
