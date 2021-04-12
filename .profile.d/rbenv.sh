# Add rbenv to PATH and MANPATH if it appears to be in use
[ -d "$HOME"/.rbenv ] || return
PATH=$HOME/.rbenv/shims:$HOME/.rbenv/bin:$PATH
# MANPATH=$HOME/.rbenv/versions/$(ruby -e 'print "#{ RUBY_VERSION }"')/man:$MANPATH
# export MANPATH
