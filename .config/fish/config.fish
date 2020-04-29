#!/usr/bin/env fish

# Don't greet me, thank you.
set fish_greeting
# Don't print working directory in a compact way.
set -gx fish_prompt_pwd_dir_length 0

# ---------------------------------------------------------------------
# PATH
# ---------------------------------------------------------------------
set -x PATH $PATH "$HOME/bin"

if test ! -d "$HOME/.cargo/bin"
  mkdir --parents --verbose "$HOME/.cargo/bin"
end
set -x PATH $PATH "$HOME/.cargo/bin"

if test ! -d "$HOME/.yarn/bin"
  mkdir --parents --verbose "$HOME/.yarn/bin"
end
set -x PATH $PATH "$HOME/.yarn/bin"

if command -v nvim > /dev/null
  set -x EDITOR nvim
else if command -v vim > /dev/null
  set -x EDITOR vim
else
  set -x EDITOR vi
end
