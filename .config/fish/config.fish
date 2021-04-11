#!/usr/bin/env fish

# Don't greet me, thank you.
set fish_greeting

# Don't print working directory in a compact way.
set fish_prompt_pwd_dir_length 0

# Extra xterm 256 colors from the srcery colorscheme.
set ORANGE        FF5F00
set BRIGHT_ORANGE FF8700
set HARD_BLACK    121212
set XGRAY1        262626
set XGRAY2        303030
set XGRAY3        3A3A3A
set XGRAY4        444444
set XGRAY5        4E4E4E
set XGRAY6        585858

# Variables for changing highlighting colors
# Even though fish has a web configuration tool, I prefer the control plain
# text files provide. Don't hide information behind a "comfy" interface.
# https://fishshell.com/docs/current/index#variables-color
set -g fish_color_autosuggestion  $XGRAY6
set -g fish_color_cancel          --reverse
set -g fish_color_command         --bold
set -g fish_color_comment         red
set -g fish_color_cwd             cyan
set -g fish_color_cwd_root        red
set -g fish_color_end             brmagenta
set -g fish_color_error           brred
set -g fish_color_escape          bryellow --bold
set -g fish_color_host            normal
set -g fish_color_host_remote     yellow
set -g fish_color_match           --background=brblue
set -g fish_color_normal          normal
set -g fish_color_operator        bryellow
set -g fish_color_param           normal
set -g fish_color_quote           yellow
set -g fish_color_redirection     brblue
set -g fish_color_search_match    --background=brblack
set -g fish_color_selection       white --bold --background=brblack
set -g fish_color_status          red
set -g fish_color_user            brgreen
set -g fish_color_valid_path      --underline

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
