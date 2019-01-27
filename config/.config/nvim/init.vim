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

  " Easy switch between single line and multiline code (gS and gJ)
  Plug 'AndrewRadev/splitjoin.vim'
  " Glorious statusline
  Plug 'itchyny/lightline.vim', { 'do': ':set noshowmode' }
  " Autopairing of characters []{}()""''
  Plug 'jiangmiao/auto-pairs'
  " For the inner writer...
  Plug 'junegunn/goyo.vim'
  " Colorize all text in the form of #rrggbb
  Plug 'lilydjwg/colorizer'
  " Parenthesis/Quotes (and tags) as text objects
  Plug 'tpope/vim-surround'
  " Easy file browsing through tags
  Plug 'majutsushi/tagbar'

  " Syntax for various languages
  Plug 'StanAngeloff/php.vim'
  Plug 'cespare/vim-toml'
  Plug 'fatih/vim-go'
  Plug 'kchmck/vim-coffee-script'
  Plug 'mxw/vim-jsx'
  Plug 'othree/html5.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'plasticboy/vim-markdown'
  Plug 'rust-lang/rust.vim'
  Plug 'tikhomirov/vim-glsl', { 'for': ['glsl', 'vert', 'lua'] }
  Plug 'tpope/vim-git'
  Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'peitalin/vim-jsx-typescript'
  " Plug 'leafgarland/typescript-vim'
  " Plug 'sirtaj/vim-openscad'

  " Coloschemes
  Plug 'dreamtigers/pseudokai'
  Plug 'morhetz/gruvbox'
  Plug 'vim-scripts/wombat'

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

" Shows the effects of a command incrementally as you type. (nvim option)
if has('nvim')
  set inccommand=nosplit
endif

" Others
" Allow different indentations per filetype.
filetype plugin indent on

" On save, remove trailing whitespace.
autocmd BufWritePre * :%s/\s\+$//e

" ---------------------------------------------------------------------
" vim-go
" ---------------------------------------------------------------------
" Don't show the error message saying I'm running an old version of Vim
let g:go_version_warning = 0

" ---------------------------------------------------------------------
" Goyo.vim
" ---------------------------------------------------------------------
let g:goyo_width='82'
let g:goyo_height='100%'
function! s:goyo_enter()
  setlocal textwidth=78
  setlocal formatoptions+=a formatoptions-=l
  if exists('$TMUX')
    silent !tmux set status off
  endif
endfunction

function! s:goyo_leave()
  set textwidth=0
  set formatoptions-=a
  if exists('$TMUX')
    silent !tmux set status on
  endif
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" ---------------------------------------------------------------------
" vim-markdown
" ---------------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1

" ---------------------------------------------------------------------
" gruvbox
" ---------------------------------------------------------------------
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

" ---------------------------------------------------------------------
" lightline
" ---------------------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
  \ 'active': {
  \   'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified']]
  \ }
  \}

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

silent! colorscheme gruvbox
