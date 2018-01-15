" -----------------------------------------------------
" Vim-Plug
" -----------------------------------------------------
" Install vim-plug if not present.
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

  Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
  Plug 'Xuyuanp/nerdtree-git-plugin'
  " Syntax for various languages
  Plug 'tikhomirov/vim-glsl', { 'for': ['glsl', 'vert', 'lua'] }
  Plug 'othree/html5.vim'

  " TODO: check which one is better.
  Plug 'lilydjwg/colorizer'
  " Plug 'ap/vim-css-color'
  
  Plug 'tpope/vim-markdown'
  Plug 'tpope/vim-git'
  " Plug 'sheerun/vim-polyglot'

  " For my inner writer...
  Plug 'junegunn/goyo.vim'

  " Coloschemes
  Plug 'ivcore/pseudokai'
  Plug 'vim-scripts/wombat'

call plug#end()

" -----------------------------------------------------
" :options
" -----------------------------------------------------
" 2 Moving around, searching and patterns
set whichwrap=b,s,<,>,[,]
set incsearch
set ignorecase
set smartcase

" 4 Displaying text
set nowrap
set breakindent
set number
" set relativenumber

" 5 Syntax, highlighting and spelling
set termguicolors
" set cursorline
" set colorcolumn=+1

" 6 Multiple windows
set splitbelow
set splitright

" 8 Terminal
set title

" 9 Using the mouse
if has('mouse')
  set mouse=a
endif

" 11 Messages and info
set showcmd
set ruler
set helplang=en
set visualbell

" 13 Editing text
set undofile

" 14 Tabs and indenting
set shiftwidth=2
set softtabstop=2
set shiftround
set smartindent

" Others
" Allow different indentations per filetype.
filetype plugin indent on
" For all text files set 'textwidth' to 80 characters.
" autocmd FileType text setlocal textwidth=80

" -----------------------------------------------------
" Goyo.vim
" -----------------------------------------------------
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

" -----------------------------------------------------
" NERDTree
" -----------------------------------------------------
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1
let g:NERDTreeShowHidden=1
let g:NERDTreeWinSize=25
let g:NERDTreeMinimalUI=1
let g:NERDTreeAutoDeleteBuffer=1

" -----------------------------------------------------
" Colors and syntax
" -----------------------------------------------------
" In color console, enable coloring and search highlighting.
if &t_Co > 2 || has("gui_running")
  syntax enable
  set background=dark
  set hlsearch
endif

" Force 256 colors.
set t_Co=256
silent! colorscheme pseudokai
