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
	" NERDTree
	Plug 'scrooloose/nerdtree' ", { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }
	Plug 'Xuyuanp/nerdtree-git-plugin'

	" Syntax for various languages
	" Plug 'WolfgangMehner/lua-support' "Lua syntax
	Plug 'tikhomirov/vim-glsl' " GLSL syntax
	Plug 'othree/html5.vim' " HTML5 syntax
	Plug 'cakebaker/scss-syntax.vim' " SCSS syntax
	Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx'] } " Color highlighter
	Plug 'tpope/vim-markdown' " Markdown syntax
	Plug 'tpope/vim-git' " Git syntax

	" Coloschemes
	Plug 'tomasr/molokai' " Molokai colorscheme
	Plug 'morhetz/gruvbox'
	Plug 'kabbamine/yowish.vim'
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

" 5 Syntax, highlighting and spelling
set termguicolors

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

" 14 Tabs and indenting
set tabstop=2
set shiftwidth=2
set smartindent

" Other (allows different indentation per file type)
filetype plugin indent on

" -----------------------------------------------------
" NERDTree
" -----------------------------------------------------
let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=25
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1

" -----------------------------------------------------
" Colors and syntax
" -----------------------------------------------------
" in color console, enable coloring and search highlighting
if &t_Co > 2 || has("gui_running")
	syntax enable
	set background=dark
	set hlsearch
endif

set t_Co=256  " force 256 colors
colorscheme molokai

if g:colors_name == 'molokai'
	" molokai's diff coloring is terrible
	highlight DiffAdd    ctermbg=22
	highlight DiffDelete ctermbg=52
	highlight DiffChange ctermbg=17
	highlight DiffText ctermbg=53
elseif g:colors_name == 'gruvbox'
	let g:gruvbox_contrast_dark = 'hard'
endif

" -----------------------------------------------------
" More natural split opening
" -----------------------------------------------------
set splitbelow
set splitright

