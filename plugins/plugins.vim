" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

source $HOME/plugins/lang.vim

" color schema
Plug 'ulwlu/elly.vim'
Plug 'morhetz/gruvbox'
Plug 'sainnhe/sonokai'

Plug 'voldikss/vim-floaterm'

Plug 'rhysd/accelerated-jk'

" git
Plug 'lambdalisue/gina.vim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'mitubaEX/blame_open.nvim'

" f motion
Plug 'rhysd/clever-f.vim'

" add: ysiw(
" replace: cs(]
" delete: ds(
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" https://tyru.hatenablog.com/entry/2020/04/26/110000
Plug 'tyru/columnskip.vim'

" html
Plug 'AndrewRadev/tagalong.vim'
Plug 'alvan/vim-closetag'

" test
Plug 'vim-test/vim-test'
Plug 'rcarriga/vim-ultest', { 'do': ':UpdateRemotePlugins' }

" fast move
Plug 'mitubaEX/jumpy.vim'
Plug 'matze/vim-move'
Plug 'mg979/vim-visual-multi'
Plug 'pechorin/any-jump.vim'

" util
Plug 'brooth/far.vim'
Plug 'tyru/open-browser.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 't9md/vim-quickhl'
Plug 'mhinz/vim-startify'
Plug 'yuttie/comfortable-motion.vim'
Plug 'tpope/vim-speeddating'
Plug 'itchyny/vim-cursorword'
Plug 'machakann/vim-highlightedyank'
Plug 'edkolev/tmuxline.vim'

" indent
Plug 'Yggdroot/indentLine'

" <Leader>r<word obj> replace word
Plug 'kana/vim-operator-user'
Plug 'kana/vim-operator-replace'

" yank motion
Plug 'osyo-manga/vim-operator-stay-cursor'

" add text obj
Plug 'wellle/targets.vim'
Plug 'bkad/CamelCaseMotion'

" wilder
Plug 'gelguy/wilder.nvim'

" fern
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" lualine
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" nvim-treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'romgrk/nvim-treesitter-context'

" telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" plant uml
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'

Plug 'easymotion/vim-easymotion'

Plug 'tweekmonster/startuptime.vim'

Plug 'vuciv/vim-bujo'

Plug 'jiangmiao/auto-pairs'

Plug 'terrortylor/nvim-comment'

Plug 'sindrets/diffview.nvim'

Plug 'glidenote/memolist.vim'

" Initialize plugin system
call plug#end()
