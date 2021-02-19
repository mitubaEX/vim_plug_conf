" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

source $HOME/plugins/lang.vim

" color schema
Plug 'ulwlu/elly.vim' 

Plug 'voldikss/vim-floaterm'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'rhysd/accelerated-jk'
Plug 'thinca/vim-quickrun'
Plug 'tyru/caw.vim'
Plug 'matze/vim-move'

" git
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-fugitive'
Plug 'lambdalisue/gina.vim'
Plug 'airblade/vim-gitgutter'

Plug 'rhysd/clever-f.vim'
Plug 'kana/vim-operator-user'
Plug 'rhysd/vim-operator-surround'

" add: ysiw(
" replace: cs(]
" delete: ds(
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

Plug 'Lokaltog/vim-easymotion'

" https://tyru.hatenablog.com/entry/2020/04/26/110000
Plug 'tyru/columnskip.vim'

Plug 'mitubaEX/jumpy.vim'
Plug 'bkad/CamelCaseMotion'

Plug 'AndrewRadev/tagalong.vim'
Plug 'cohama/lexima.vim'
Plug 'alvan/vim-closetag'
Plug 'rhysd/clever-split.vim'

Plug 'brooth/far.vim'
Plug 'deris/vim-rengbang'
Plug 'tyru/open-browser.vim'
Plug 'vim-test/vim-test'
Plug 'AndrewRadev/linediff.vim'
Plug 'pechorin/any-jump.vim'
Plug 't9md/vim-quickhl'
Plug 'mhinz/vim-startify'
Plug 'Yggdroot/indentLine'
Plug 'yuttie/comfortable-motion.vim'
Plug 'mg979/vim-visual-multi'
Plug 'tpope/vim-speeddating'
Plug 'itchyny/vim-cursorword'
Plug 'machakann/vim-highlightedyank'
Plug 'edkolev/tmuxline.vim'

" <Leader>r<word obj> replace word
Plug 'kana/vim-operator-user'

Plug 'osyo-manga/vim-operator-stay-cursor'
Plug 'lambdalisue/wifi.vim'
Plug 'lambdalisue/battery.vim'
Plug 'wellle/targets.vim'

Plug 'gelguy/wilder.nvim'

" fern
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/nerdfont.vim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim' 

Plug 'itchyny/lightline.vim'

" Initialize plugin system
call plug#end()
