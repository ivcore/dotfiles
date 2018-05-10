" ---------------------------------------------------------------------
" Vim-Plug
" ---------------------------------------------------------------------
" Install vim-plug if not present.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

  " Autopairing of tags and characters
  Plug 'alvan/vim-closetag'
  Plug 'jiangmiao/auto-pairs'

  " Syntax for various languages
  Plug 'tikhomirov/vim-glsl', { 'for': ['glsl', 'vert', 'lua'] }
  Plug 'othree/html5.vim'
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-git'
  " Plug 'ElmCast/elm-vim', { 'for': ['elm'] }
  Plug 'pangloss/vim-javascript'
  Plug 'mxw/vim-jsx'
  Plug 'jparise/vim-graphql'
  Plug 'elzr/vim-json'

  Plug 'lilydjwg/colorizer'

  " For the inner writer...
  Plug 'junegunn/goyo.vim'

  " Coloschemes
  Plug 'dreamtigers/pseudokai'
  Plug 'vim-scripts/wombat'

  " Glorious statusline
  Plug 'itchyny/lightline.vim', { 'do': ':set noshowmode' }

call plug#end()

" ---------------------------------------------------------------------
" :options
" ---------------------------------------------------------------------
" 2 Moving around, searching and patterns
set incsearch
set ignorecase
set smartcase

" 4 Displaying text
set nowrap
set number

" 5 Syntax, highlighting and spelling
set background=dark
set hlsearch
set termguicolors
" set cursorline
" set colorcolumn=+1

" 6 Multiple windows
set splitbelow
set splitright

" 9 Using the mouse
if has('mouse')
  set mouse=a
endif

" 11 Messages and info
set showcmd
set noshowmode

" 13 Editing text
set undofile

" 14 Tabs and indenting
set shiftwidth=2
set softtabstop=2
set shiftround
" Filetype indent should be the one handling indentation.
" set smartindent

" Others
" Allow different indentations per filetype.
filetype plugin indent on

" On save, remove trailing whitespace.
autocmd BufWritePre * :%s/\s\+$//e

" ---------------------------------------------------------------------
" vim-closetag
" ---------------------------------------------------------------------
let g:closetag_filenames = '*.html, *.xhtml, *.phtml, *.jsx, *.js'

" ---------------------------------------------------------------------
" Goyo.vim
" ---------------------------------------------------------------------
function! s:goyo_enter()
  setlocal textwidth=80
  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  set textwidth=0
  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ---------------------------------------------------------------------
" FUNCTIONS (for statusline)
" ---------------------------------------------------------------------
" Find out current buffer's size and return it.
function! FileSize()
  let l:bytes = getfsize(expand('%:p'))
  if (l:bytes >= 1024)
    let l:kbytes = l:bytes / 1024
  endif
  if (exists('kbytes') && l:kbytes >= 1000)
    let l:mbytes = l:kbytes / 1000
  endif

  if l:bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return l:mbytes . 'MB '
  elseif (exists('kbytes'))
    return l:kbytes . 'KB '
  else
    return l:bytes . 'B '
  endif
endfunction

" ---------------------------------------------------------------------
" Colors and syntax
" ---------------------------------------------------------------------
" In color console, enable coloring and search highlighting.
if &t_Co > 2 || has("gui_running")
  syntax enable
endif

silent! colorscheme pseudokai
