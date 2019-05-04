" See `:help ftplugin-overrule`

let b:undo_ftplugin = "setl et< sts< tw< fo<"

" Make sure a hard tab is used, required for most make programs
setlocal softtabstop=0 shiftwidth=8 noexpandtab
setlocal textwidth=80

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal fo-=t fo+=croql
