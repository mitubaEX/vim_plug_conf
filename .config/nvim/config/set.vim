set hidden
set wildmenu
set showcmd
set wildmode=list:longest,full
set wildignorecase
set shell=$SHELL
set title " set terminal title
set showmatch " show matching braces

" search
set hlsearch
set ignorecase
set smartcase
set smartindent
set incsearch
set inccommand=split
set nolazyredraw

set magic

set backspace=indent,eol,start
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set t_vb=
set cmdheight=1
set whichwrap=b,s,<,>,[,],h,l

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8,cp932
set fenc=utf-8
scriptencoding utf-8
set wrap
set autoindent
set ttyfast
set number
set sm
set ai
set noswapfile

set linebreak
set showbreak=…
set so=7

" clipboard combination
set clipboard+=unnamedplus
set tabstop=2
set shiftwidth=2
set expandtab

" fzf condition
if has("mac")
    set rtp+=/usr/local/opt/fzf
elseif has("unix")
    set rtp+=~/.fzf
endif

set wrapscan

se ff=unix

set ttimeout
set ttimeoutlen=50

set virtualedit=block

set foldmethod=marker
set foldlevel=2
set foldcolumn=1

" inifinite undo
set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
  call mkdir(expand("$HOME/.vim/undodir", "p"))
endif
set undodir=$HOME/.vim/undodir

" tablineを表示する
set showtabline=2
