" deoplete
" let g:deoplete#enable_at_startup = 0
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('')[col - 1]  =~ '\s'
" endfunction
" call deoplete#custom#option('keyword_patterns', {
"      \ '_': '[a-zA-Z_]\k*\(?',
"      \ })
" call deoplete#custom#option('camel_case', v:true)
" " <TAB>: completion.
" inoremap <silent><expr> <TAB>
"      \ pumvisible() ? "\<C-n>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ deoplete#manual_complete()
" call deoplete#custom#source('_', 'converters', [
"      \ 'converter_remove_paren',
"      \ 'converter_remove_overlap',
"      \ 'matcher_length',
"      \ 'converter_truncate_abbr',
"      \ 'converter_truncate_menu',
"      \ 'converter_auto_delimiter',
"      \ ])

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
"                   \ 'name': 'solargraph',
"                   \ 'cmd': {server_info->[&shell, &shellcmdflag, 'solargraph stdio']},
"                   \ 'initialization_options': {"diagnostics": "true"},
"                   \ 'allowlist': ['ruby'],
"                   \ })
"     augroup END
" endif

" typescript
" install commands
" $ npm install -g typescript typescript-language-server
" if executable('typescript-language-server')
"     augroup LspTypeScript
"         autocmd!
"         autocmd User lsp_setup call lsp#register_server({
"                   \ 'name': 'typescript-language-server',
"                   \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
"                   \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
"                   \ 'allowlist': ['typescript', 'typescript.tsx', 'typescriptreact'],
"                   \ })
"     augroup END
" endif

" flowtype
" install commands
" $ npm install -g flow-language-server
" $ npm install -g flow-bin@0.108.0
" $ npm install -g flow-typed@2.6.2
if executable('flow-language-server')
    augroup LspTypeScript
        autocmd!
        autocmd User lsp_setup call lsp#register_server({
                   \ 'name': 'flow-language-server',
                   \ 'cmd': {server_info->[&shell, &shellcmdflag, 'flow-language-server --stdio']},
                   \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
                   \ 'allowlist': ['javascript'],
                   \ })
    augroup END
endif

" typescript file type
autocmd bufnewfile,bufread *.tsx set filetype=typescriptreact
autocmd bufnewfile,bufread *.jsx set filetype=javascriptreact

" keybinds {{{
" check definition
" nmap K :LspPeekDefinition<CR>

" nmap gd :LspDefinition<CR>

" nmap gl :LspReferences<CR>

" nmap gr :LspRename<CR>

" nmap gt :LspTypeDefinition<CR>

" nmap gc :LspDocumentDiagnostics<CR>

" nmap ga :LspCodeAction<CR>
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

let g:completion_timer_cycle = 30

" vim-lsp-settings config
" let g:lsp_settings = {
"\  'typescript-language-server': {
"\    'blocklist': ['javascript'],
"\  },
"\}

lua << EOF
-- commented options are defaults
require('lspkind').init({
    with_text = true,
    symbol_map = {
      Text = '',
      Method = 'ƒ',
      Function = '',
      Constructor = '',
      Variable = '',
      Class = '',
      Interface = 'ﰮ',
      Module = '',
      Property = '',
      Unit = '',
      Value = '',
      Enum = '了',
      Keyword = '',
      Snippet = '﬌',
      Color = '',
      File = '',
      Folder = '',
      EnumMember = '',
      Constant = '',
      Struct = ''
    },
})
EOF

lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF

nnoremap <silent>ga :Lspsaga code_action<CR>
vnoremap <silent>ga :<C-U>Lspsaga range_code_action<CR>

nnoremap <silent> gh :Lspsaga lsp_finder<CR>

nnoremap <silent>K :Lspsaga hover_doc<CR>
" scroll down hover doc or scroll in definition preview
" nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
" scroll up hover doc
" nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

" nnoremap <silent> gs :Lspsaga signature_help<CR>

nnoremap <silent>gr :Lspsaga rename<CR>

" nnoremap <silent> gd :Lspsaga preview_definition<CR>

nnoremap <silent> [e :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> ]e :Lspsaga diagnostic_jump_prev<CR>

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>

autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

" vsnip
" Expand
imap <expr> <C-f>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-f>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'
" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']
