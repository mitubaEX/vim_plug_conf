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

" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_sync(nil, 100)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

" nvim-lspconfig
lua << EOF
require'lspconfig'.tsserver.setup{
  -- filetypes = {'typescript', 'typescript.tsx', 'typescriptreact'}
}
require'lspconfig'.solargraph.setup{}
require'lspconfig'.flow.setup{}
require'lspconfig'.yamlls.setup{}
EOF

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
    spell = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
  };
}
EOF

" NOTE: Order is important. You can't lazy loading lexima.vim.
" let g:lexima_no_default_rules = v:true
" call lexima#set_default_rules()
" inoremap <silent><expr> <C-Space> compe#complete()
" inoremap <silent><expr> <CR>      compe#confirm(lexima#expand('<LT>CR>', 'i'))

" vista {{{
" How each level is indented and what to prepend.
" This could make the display more compact or more spacious.
" e.g., more compact: ["▸ ", ""]
" Note: this option only works for the kind renderer, not the tree renderer.
let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

" Executive used when opening vista sidebar without specifying it.
" See all the avaliable executives via `:echo g:vista#executives`.
let g:vista_default_executive = 'nvim_lsp'

" To enable fzf's preview window set g:vista_fzf_preview.
" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
" For example:
let g:vista_fzf_preview = ['right:50%']

" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
let g:vista#renderer#enable_icon = 1
" }}}
