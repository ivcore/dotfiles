" Use spaces when inserting a <Tab>
setlocal expandtab
" Insert two spaces per <Tab>
setlocal shiftwidth=2
" Make 'softtabstop' mirror the value of 'shiftwidth'
setlocal softtabstop=-1
" Clean up buffer-local indentation changes on a change of filetype
let b:undo_indent .= '|setlocal expandtab< shiftwidth< softtabstop<'
