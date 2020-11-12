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
set -g fish_color_cwd             green
set -g fish_color_cwd_root        red
set -g fish_color_end             brmagenta
set -g fish_color_error           brred
set -g fish_color_escape          bryellow --bold
set -g fish_color_host            normal
set -g fish_color_host_remote     yellow
set -g fish_color_match           --background=brblue
set -g fish_color_normal          normal
set -g fish_color_operator        bryellow
set -g fish_color_param           cyan
set -g fish_color_quote           yellow
set -g fish_color_redirection     brblue
set -g fish_color_search_match    --background=brblack
set -g fish_color_selection       white --bold --background=brblack
set -g fish_color_status          red
set -g fish_color_user            brgreen
set -g fish_color_valid_path      --underline

# fish_git_prompt - output git information for use in a prompt.
# https://fishshell.com/docs/current/cmds/fish_git_prompt.html

# Keep the color prompt consistent with cwd's color.
set -g __fish_git_prompt_color $fish_color_cwd

# Show if the repository is "dirty" (i.e. has uncommited changes).
set -g __fish_git_prompt_showdirtystate
# Variables used with `showdirtystate`.
set -g __fish_git_prompt_color_dirtystate yellow
set -g __fish_git_prompt_color_invalidstate brred
set -g __fish_git_prompt_color_stagedstate green

# Show if the repository has untracked files (that aren't ignored).
set -g __fish_git_prompt_showuntrackedfiles
# Variables used with `showuntrackedfiles`.
set -g __fish_git_prompt_color_untrackedfiles red

# Enable coloring for the branch name (and status symbols, but we just set that
# up in the previous lines).
set -g __fish_git_prompt_showcolorhints
# Variables used with `showcolorhints`.
set -g __fish_git_prompt_color_branch brmagenta

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
