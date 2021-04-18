" solargraph
" When enter rails project, run bellow commands
" $ gem install solargraph
" $ solargraph download-core
" $ solargraph bundle
" $ solargraph config

" typescript
" install commands
" $ npm install -g typescript typescript-language-server

" flowtype
" install commands
" $ npm install -g flow-language-server
" $ npm install -g flow-bin@0.108.0
" $ npm install -g flow-typed@2.6.2

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gl <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

" nvim-lspconfig
lua << EOF
require'lspconfig'.tsserver.setup{
  -- filetypes = {'typescript', 'typescript.tsx', 'typescriptreact'}
}
require'lspconfig'.solargraph.setup{}
require'lspconfig'.flow.setup{}
require'lspconfig'.yamlls.setup{}
EOF

" nvim-completion
" let g:completion_enable_snippet = 'vim-vsnip'
"
" " Use completion-nvim in every buffer
" autocmd BufEnter * lua require'completion'.on_attach()
"
" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
" " Set completeopt to have a better completion experience
" set completeopt=menuone,noinsert,noselect
"
" " Avoid showing message extra message when using completion
" set shortmess+=c
"
" let g:completion_timer_cycle = 30

" lspkind
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

" lspsaga
lua << EOF
local saga = require 'lspsaga'
saga.init_lsp_saga()
EOF

nnoremap <silent>ga :Lspsaga code_action<CR>
vnoremap <silent>ga :<C-U>Lspsaga range_code_action<CR>

nnoremap <silent>K :Lspsaga hover_doc<CR>

nnoremap <silent>gr :Lspsaga rename<CR>

nnoremap <silent> ge :Lspsaga diagnostic_jump_next<CR>

" vsnip
" Expand
imap <expr> <C-f>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-f>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'
" Jump forward or backward
imap <expr> <C-b>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-b>'
smap <expr> <C-b>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-b>'
" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']

" nvim-compe
set completeopt=menuone,noselect

lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}
EOF

" NOTE: Order is important. You can't lazy loading lexima.vim.
let g:lexima_no_default_rules = v:true
call lexima#set_default_rules()
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))
