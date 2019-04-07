function fish_prompt --description "Write out the left prompt"
    echo -n -s "$USER" @ (prompt_hostname) '> '
end
