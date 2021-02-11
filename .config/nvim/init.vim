" vim plug config
source $HOME/plugins/plugins.vim

" nvim config
source $HOME/.config/nvim/config/keybinds.vim
source $HOME/.config/nvim/config/set.vim
source $HOME/.config/nvim/config/color.vim
source $HOME/.config/nvim/config/util_script.vim
source $HOME/.config/nvim/config/fzf_functions.vim
source $HOME/.config/nvim/config/plugin_config.vim

if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ asyncomplete#force_refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
