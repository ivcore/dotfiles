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
Plug 'WolfgangMehner/lua-support' "Lua syntax
Plug 'tikhomirov/vim-glsl' " GLSL syntax
Plug 'othree/html5.vim' " HTML5 syntax
Plug 'cakebaker/scss-syntax.vim' " SCSS syntax
Plug 'lilydjwg/colorizer', { 'for': ['css', 'sass', 'scss', 'less', 'html', 'xdefaults', 'javascript', 'javascript.jsx'] } " Color highlighter
Plug 'tpope/vim-markdown' " Markdown syntax
Plug 'tpope/vim-git' " Git syntax

call plug#end()

" :options

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
set background=dark
set termguicolors
syntax enable

" 8 Terminal
set title

" 11 Messages and info
set showcmd
set ruler
set helplang=en
set visualbell

" 14 Tabs and indenting
set tabstop=2
set shiftwidth=2
set smartindent

" Other
filetype plugin indent on

" -----------------------------------------------------
" NERDTree
" -----------------------------------------------------

let g:NERDTreeMinimalUI=1
let g:NERDTreeWinSize=50
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeShowHidden=1
let g:NERDTreeHighlightCursorline=0
let g:NERDTreeRespectWildIgnore=1

" -----------------------------------------------------
" Vim-Plug
" -----------------------------------------------------

nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pU :PlugUpgrade<CR>
nnoremap <leader>pc :PlugClean<CR>

" Color scheme based on time {{{
"if strftime("%H") < 19
"  colorscheme badwolf
"else
"  colorscheme iceberg
"endif
"}}}
