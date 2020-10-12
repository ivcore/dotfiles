autocmd BufNewFile,BufRead
    \ Neomuttrc
    \,*/.neomuttrc.d/?*.rc
    \,*/neomuttrc.d/?*.rc
    \,.neomuttrc
    \,neomuttrc
    \,/etc/Neomuttrc.d/*
    \,*.neomuttrc
    \ setfiletype neomuttrc
