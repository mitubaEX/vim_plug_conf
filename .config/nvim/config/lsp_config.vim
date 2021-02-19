" solargraph
" When enter rails project, run bellow commands
" $ gem install solargraph
" $ solargraph download-core
" $ solargraph bundle
" $ solargraph config
if executable('solargraph')
    " gem install solargraph
    au User lsp_setup call lsp#register_server({
        \ 'name': 'solargraph',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
        \ 'initialization_options': {"diagnostics": "true"},
        \ 'whitelist': ['ruby'],
        \ })
endif

" typescript
" install commands
" $ npm install -g typescript typescript-language-server
if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript', 'typescript.tsx', 'typescriptreact'],
        \ })
endif

" typescript file type
autocmd bufnewfile,bufread *.tsx set filetype=typescriptreact
autocmd bufnewfile,bufread *.jsx set filetype=javascriptreact

" efm-langserver
if executable('efm-langserver')
    augroup LspEFM
        au!
        autocmd User lsp_setup call lsp#register_server({
                    \ 'name': 'efm-langserver-eslint',
                    \ 'cmd': {server_info->['efm-langserver', '-c='.$HOME.'/.config/efm-langserver/config.yaml']},
                    \ 'allowlist': ['vim', 'eruby', 'markdown', 'yaml', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'],
                    \ })
    augroup END
endif

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" keybinds {{{
" check definition
nmap K :LspPeekDefinition<CR>

nmap gd :LspDefinition<CR>

nmap gr :LspRename<CR>

nmap gt :LspTypeDefinition<CR>
" }}}
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
