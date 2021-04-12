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
  Plug 'dag/vim-fish'
  Plug 'elixir-editors/vim-elixir'
  " Plug 'fatih/vim-go'
  " Plug 'kchmck/vim-coffee-script'
  Plug 'ledger/vim-ledger'
  Plug 'mxw/vim-jsx'
  Plug 'othree/html5.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'plasticboy/vim-markdown'
  " Plug 'rust-lang/rust.vim'
  Plug 'slim-template/vim-slim'
  Plug 'tpope/vim-git'
  Plug 'HerringtonDarkholme/yats.vim'
  " Plug 'peitalin/vim-jsx-typescript'
  " Plug 'leafgarland/typescript-vim'
  " Plug 'lervag/vimtex'
  Plug 'https://tildegit.org/sloum/gemini-vim-syntax.git', {'for': ['gemini', 'gmi']}
  Plug 'https://git.sr.ht/~sircmpwn/hare.vim'

  " Coloschemes
  " Plug 'dracula/vim', {'as': 'dracula'}
  " Plug 'kkga/vim-envy'
  " Plug 'morhetz/gruvbox'
  Plug 'srcery-colors/srcery-vim'
  " Plug 'vim-scripts/wombat'
  " Plug 'https://git.sr.ht/~leon_plickat/paige'
  " Plug 'evprkr/galaxian-vim'

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
set list
set lazyredraw
set number

" 5 Syntax, highlighting and spelling
set background=dark
set synmaxcol=500
set hlsearch
set termguicolors
" set cursorline
" set colorcolumn=+1

" 6 Multiple windows
set splitbelow splitright

" 9 Using the mouse
if has('mouse')
  set mouse=a
endif

" 11 Messages and info
set showcmd
set noshowmode

" 13 Editing text
set undofile
set formatoptions+=1

" 14 Tabs and indenting
" I give up. Tab is dead, long live space.
set shiftwidth=4
set smarttab
set softtabstop=-1
set expandtab
" Filetype indent should be the one handling indentation.
" set smartindent

" 18 Reading and writing files
set nomodeline

" 20 Command line editing
set wildignore=*~,#*#,*.7z,.DS_Store,.git,.hg,.svn,*.a,*.adf,*.asc,*.au,*.aup
      \,*.avi,*.bin,*.bmp,*.bz2,*.class,*.db,*.dbm,*.djvu,*.docx,*.exe
      \,*.filepart,*.flac,*.gd2,*.gif,*.gifv,*.gmo,*.gpg,*.gz,*.hdf,*.ico
      \,*.iso,*.jar,*.jpeg,*.jpg,*.m4a,*.mid,*.mp3,*.mp4,*.o,*.odp,*.ods,*.odt
      \,*.ogg,*.ogv,*.opus,*.pbm,*.pdf,*.png,*.ppt,*.psd,*.pyc,*.rar,*.rm
      \,*.s3m,*.sdbm,*.sqlite,*.swf,*.swp,*.tar,*.tga,*.ttf,*.wav,*.webm,*.xbm
      \,*.xcf,*.xls,*.xlsx,*.xpm,*.xz,*.zip

" 25 Various
set virtualedit+=block

" Shows the effects of a command incrementally as you type. (nvim only)
if has('nvim')
  set inccommand=nosplit
endif

" Others
" Allow different indentations per filetype.
filetype plugin indent on

" On save, remove trailing whitespace.
" autocmd BufWritePre * :%s/\s\+$//e

" ---------------------------------------------------------------------
" mappings
" ---------------------------------------------------------------------
" Without leader
" stack a :nohlsearch command to stop highlighting searches on top of
" clear and redraw of the screen.
nnoremap <C-L>
      \ :<C-U>nohlsearch<CR><C-L>

" With leader
"" Leader\h toggles highlighting search results
nnoremap <Leader>h
      \ :<C-U>set hlsearch! hlsearch?<CR>
"
nnoremap <Leader>m
            \ :<C-U>make<CR>
"" Leader\l toggles showing tab, end-of-line, and trailing white space
noremap <Leader>l
      \ :<C-U>set list! list?<CR>
ounmap <Leader>l
sunmap <Leader>l

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
if &t_Co > 2 || has#("gui_running")
  syntax enable
endif

silent! colorscheme srcery
