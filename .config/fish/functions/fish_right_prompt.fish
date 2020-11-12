# fish_git_prompt - output git information for use in a prompt.
# https://fishshell.com/docs/current/cmds/fish_git_prompt.html

# Keep the color prompt consistent with cwd's color.
set __fish_git_prompt_color $fish_color_cwd

# Show if the repository is "dirty" (i.e. has uncommited changes).
set __fish_git_prompt_showdirtystate
# Variables used with `showdirtystate`.
set __fish_git_prompt_color_dirtystate yellow
set __fish_git_prompt_color_invalidstate brred
set __fish_git_prompt_color_stagedstate green

# Show if the repository has untracked files (that aren't ignored).
set __fish_git_prompt_showuntrackedfiles
# Variables used with `showuntrackedfiles`.
set __fish_git_prompt_color_untrackedfiles red

# Enable coloring for the branch name (and status symbols, but we just set that
# up in the previous lines).
set __fish_git_prompt_showcolorhints
# Variables used with `showcolorhints`.
set __fish_git_prompt_color_branch brmagenta

function fish_right_prompt --description "Write out the right prompt"
    set -l color_cwd
    set -l exit_code $status

    if test $exit_code -ne 0
	echo -n -s (set_color --bold) "[$exit_code] " (set_color normal)
    end

    switch "$USER"
        case root toor
            if set -q fish_color_cwd_root
                set color_cwd $fish_color_cwd_root
            else
                set color_cwd $fish_color_cwd
            end
        case '*'
            set color_cwd $fish_color_cwd
    end

    echo -n -s (set_color $color_cwd) (prompt_pwd) (set_color normal) (fish_git_prompt)
end
