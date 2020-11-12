" Taken from /usr/share/vim/vim*/vimrc_example.vim
" Jump to the last position when reopening a file.
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif
