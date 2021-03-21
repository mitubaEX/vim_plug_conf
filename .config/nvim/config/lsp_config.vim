" deoplete
let g:deoplete#enable_at_startup = 0

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('')[col - 1]  =~ '\s'
endfunction
call deoplete#custom#option('keyword_patterns', {
      \ '_': '[a-zA-Z_]\k*\(?',
      \ })
call deoplete#custom#option('camel_case', v:true)
" <TAB>: completion.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()
call deoplete#custom#source('_', 'converters', [
      \ 'converter_remove_paren',
      \ 'converter_remove_overlap',
      \ 'matcher_length',
      \ 'converter_truncate_abbr',
      \ 'converter_truncate_menu',
      \ 'converter_auto_delimiter',
      \ ])

" solargraph
" When enter rails project, run bellow commands
" $ gem install solargraph
" $ solargraph download-core
" $ solargraph bundle
" $ solargraph config
" if executable('solargraph')
"     augroup LspRuby
"         autocmd!
"         autocmd User lsp_setup call lsp#register_server({
"                    \ 'name': 'solargraph',
"                    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
"                    \ 'initialization_options': {"diagnostics": "true"},
"                    \ 'whitelist': ['ruby'],
"                    \ })
"     augroup END
" endif

" typescript
" install commands
" $ npm install -g typescript typescript-language-server
" if executable('typescript-language-server')
"     augroup LspTypeScript
"         autocmd!
"         autocmd User lsp_setup call lsp#register_server({
"                    \ 'name': 'typescript-language-server',
"                    \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"                    \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"                    \ 'whitelist': ['typescript', 'typescript.tsx', 'typescriptreact'],
"                    \ })
"     augroup END
" endif

" typescript file type
autocmd bufnewfile,bufread *.tsx set filetype=typescriptreact
autocmd bufnewfile,bufread *.jsx set filetype=javascriptreact

" keybinds {{{
" check definition
nmap K :LspPeekDefinition<CR>

nmap gd :LspDefinition<CR>

nmap gl :LspReferences<CR>

nmap gr :LspRename<CR>

nmap gt :LspTypeDefinition<CR>
" }}}
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')


" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c
