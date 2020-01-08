" Fold based on indent level, but start with all folds open
setlocal foldmethod=indent
setlocal foldlevel=99
let b:undo_ftplugin .= '|setlocal foldmethod< foldlevel<'

" Keywords for including files
let &l:include = '\<source\>\|\<runtime!\=\>'

" Search runtime paths for included scripts
let &l:path = &runtimepath . ',' . &path

" Adjust the match words for the matchit plugin; the default filetype plugin
" matches e.g. an opening "function" with the first "return" within, which I
" don't like
if exists('loaded_matchit')
  let b:match_words = '\<fu\%[nction]\>:\<endf\%[unction]\>,'
        \ . '\<\(wh\%[ile]\|for\)\>:\<end\(w\%[hile]\|fo\%[r]\)\>,'
        \ . '\<if\>:\<el\%[seif]\>:\<en\%[dif]\>,'
        \ . '\<try\>:\<cat\%[ch]\>:\<fina\%[lly]\>:\<endt\%[ry]\>,'
        \ . '\<aug\%[roup]\s\+\%(END\>\)\@!\S:\<aug\%[roup]\s\+END\>,'
endif

" Stop here if the user doesn't want ftplugin mappings
if exists('no_plugin_maps') || exists('no_vim_maps')
  finish
endif

" ,@ executes line in normal mode
nnoremap <buffer> <LocalLeader>@
      \ ^"zyg_@z
let b:undo_ftplugin .= '|nunmap <buffer> <LocalLeader>@'
