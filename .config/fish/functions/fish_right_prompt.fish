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

    echo -n -s (set_color $color_cwd) (prompt_pwd) (__fish_vcs_prompt) (set_color normal)
end
