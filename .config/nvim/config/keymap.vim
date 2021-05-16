" reader ref:https://postd.cc/how-to-boost-your-vim-productivity/
let maplocalleader = "\\"
let mapleader = "\<Space>"

nnoremap <silent> <Leader>w <Esc>:w<CR>
nnoremap <silent> <Leader>o :CtrlP<CR>

noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

" move method of cursor in insert mode
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>

nnoremap <tab> gt
nnoremap <C-q> :Bdelete this<CR>

" escape
inoremap <silent> jj <ESC>

" move previous buffer
nnoremap <Leader>n :b #<Enter>
tnoremap <silent> <ESC> <C-\><C-n>

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" git config {{{
""" Gina
" grep
nnoremap <C-g>g  :<C-u>Gina grep<CR>

" commit
nnoremap <C-g>c  :<C-u>Gina commit -v<CR>

" status
nnoremap <C-g>s  :<C-u>Gina status<CR>

" blame
nnoremap <C-g>b  :<C-u>Gina blame<CR>

" browse
nnoremap <C-g>o  :<C-u>Gina browse :%<CR>

" log
function! s:gLogCurrentFile() abort
	let cfile = expand('%')
	execute "Gina log " . cfile
endfunction
command! -nargs=* GLogCurrentFile call s:gLogCurrentFile()
nnoremap <C-g>l  :<C-u>GLogCurrentFile<CR>

""" diff(diffview.nvim)
nnoremap <C-g>d  :DiffviewOpen<CR>
nnoremap <C-g>D  :DiffviewClose<CR>
" }}}

" copy 0 register
noremap <Leader>p "0p
noremap <Leader>P "0P
vnoremap <Leader>p "0p

" noh
nnoremap <Esc><Esc> :noh<CR>

" insert new line without entering insert mode
nnoremap <Leader>o o<Esc>

" fern
nnoremap <Leader>d :Fern . -reveal=% -drawer -toggle<CR>

" pbcopy filename {{{
"" only filename
nmap <Leader>c :!echo "%:t" \| pbcopy<CR>
"" relative path
nmap <Leader>C :!echo "%" \| pbcopy<CR>
" }}}

" vim-test
" nmap <Leader>q :TestFile<CR>
" nmap <Leader>Q :TestNearest<CR>

" floaterm
nmap <Leader>[ :FloatermToggle<CR>

" reload config file
nnoremap <Leader>R :so ~/.config/nvim/init.vim<CR>

" columnskip
nmap <Leader>j <Plug>(columnskip:nonblank:next)
omap <Leader>j <Plug>(columnskip:nonblank:next)
xmap <Leader>j <Plug>(columnskip:nonblank:next)
nmap <Leader>k <Plug>(columnskip:nonblank:prev)
omap <Leader>k <Plug>(columnskip:nonblank:prev)
xmap <Leader>k <Plug>(columnskip:nonblank:prev)

" previous jump
nnoremap <C-p> <C-i>

" fzf
nmap <Leader>t :call fzf#run(fzf#wrap('files', {'source': 'rg --files --hidden --glob "!.git/*"'}))<CR>
nmap <Leader>T :GFiles<CR>
nmap ; :Buffers<CR>
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=node_modules --exclude=test --exclude=spec --exclude=vendor'

" any junmp {{{
" Normal mode: Jump to definition under cursore
nnoremap <leader>a :AnyJump<CR>

" Visual mode: jump to selected text in visual mode
xnoremap <leader>a :AnyJumpVisual<CR>
" }}}

" easymotion {{{
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1
let g:EasyMotion_do_mapping = 0 " Disable default mappings

map  <Leader>e <Plug>(easymotion-bd-w)
nmap <Leader>e <Plug>(easymotion-overwin-w)
" }}}

" open terminal in vsplit
nnoremap <Leader>- :vs<CR>
nnoremap <Leader>= :vs +te<CR>

" move ultest popup window
nmap <Leader>u <Plug>(ultest-output-jump)
nmap <Leader>q :Ultest<CR>
nmap <Leader>Q :UltestNearest<CR>
nmap ]t <Plug>(ultest-next-fail)
nmap [t <Plug>(ultest-prev-fail)

" operator-replace
vmap p <Plug>(operator-replace)
nmap <Leader>r <Plug>(operator-replace)

" mitubaEX/toggle_rspec_file.nvim
nmap <Leader>x :ToggleRspecFile<CR>
