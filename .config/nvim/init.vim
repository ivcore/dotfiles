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
  " Let's all agree on style using editorconfig
  Plug 'editorconfig/editorconfig-vim'
  " Glorious statusline
  Plug 'itchyny/lightline.vim', {'do': ':set noshowmode'}
  " Autopairing of characters []{}()""''
  Plug 'jiangmiao/auto-pairs'
  " Ease aligning
  Plug 'junegunn/vim-easy-align'
  " Colorize all text in the form of #rrggbb
  Plug 'lilydjwg/colorizer'
  " Use `gcc` to toggle comment of code
  Plug 'tpope/vim-commentary'
  " Use `s` to treat parenthesis/quotes as text objects
  Plug 'tpope/vim-surround'

  " Syntax for various languages
  Plug 'StanAngeloff/php.vim'
  Plug 'cespare/vim-toml'
  Plug 'elixir-editors/vim-elixir'
  Plug 'fatih/vim-go'
  Plug 'kchmck/vim-coffee-script'
  Plug 'mxw/vim-jsx'
  Plug 'othree/html5.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'plasticboy/vim-markdown'
  " Plug 'tikhomirov/vim-glsl', {'for': ['glsl', 'vert', 'lua']}
  Plug 'tpope/vim-git'
  Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'peitalin/vim-jsx-typescript'
  " Plug 'leafgarland/typescript-vim'

  " Coloschemes
  Plug 'morhetz/gruvbox'
  Plug 'vim-scripts/wombat'
  Plug 'dracula/vim', {'as': 'dracula'}
  Plug 'srcery-colors/srcery-vim'

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
set synmaxcol=500
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
set tabstop=4
set shiftwidth=4
" set softtabstop=4
set noexpandtab
" Filetype indent should be the one handling indentation.
" set smartindent

" Shows the effects of a command incrementally as you type. (nvim only)
if has('nvim')
  set inccommand=nosplit
endif

" Others
" Allow different indentations per filetype.
filetype plugin indent on

" On save, remove trailing whitespace.
" autocmd BufWritePre * :%s/\s\+$//e

" Uncomment the following to have Vim jump to the last position when
" reopening a file (taken from /usr/share/vim/vim*/vimrc_example.vim)
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g'\"" |
  \ endif

" ---------------------------------------------------------------------
" editorconfig
" ---------------------------------------------------------------------
" Highlight only the characters that go beyond the max line
let g:EditorConfig_max_line_indicator = "exceeding"

" ---------------------------------------------------------------------
" vim-go
" ---------------------------------------------------------------------
" Don't show the error message saying I'm running an old version of Vim
let g:go_version_warning = 0

" ---------------------------------------------------------------------
" vim-markdown
" ---------------------------------------------------------------------
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1

" ---------------------------------------------------------------------
" gruvbox
" ---------------------------------------------------------------------
let g:gruvbox_italic = 1
let g:gruvbox_contrast_dark = 'hard'

" ---------------------------------------------------------------------
" srcery
" ---------------------------------------------------------------------
let g:srcery_italic = 1
let g:srcery_inverse_matches = 1

" ---------------------------------------------------------------------
" lightline
" ---------------------------------------------------------------------
let g:lightline = {
  \ 'colorscheme': 'srcery',
  \ 'active': {
  \   'left': [['mode', 'paste'], ['readonly', 'relativepath', 'modified']]
  \ }
  \}

" ---------------------------------------------------------------------
" Colors and syntax
" ---------------------------------------------------------------------
" In color console, enable coloring and search highlighting.
if &t_Co > 2 || has("gui_running")
  syntax enable
endif

silent! colorscheme srcery
" vim: tabstop=2 shiftwidth=2 softtabstop=2 expandtab
