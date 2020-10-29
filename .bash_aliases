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

alias ..='cd ..'
# Print each PATH entry on a separate line.
alias path='echo -e ${PATH//:/\\\n}'
# A much more wholesome UNIX experience.
# https://twitter.com/ctrlshifti/status/1160812366293901314
alias please='sudo'
# Start web server from current dir. Port optional: `start-web-server 1111`.
alias start-web-server='python3 -m http.server'
