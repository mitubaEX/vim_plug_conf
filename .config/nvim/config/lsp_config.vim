" solargraph
" When enter rails project, run bellow commands
" $ gem install solargraph
" $ solargraph download-core
" $ solargraph bundle
" $ solargraph config
"
" install rubocop
" NOTE: Please asdf disable.
" $ sudo gem install -v <version> rubocop
" # optional
" $ sudo gem install -v <version> rubocop-performance
" $ sudo gem install -v <version> rubocop-rspec
" $ sudo gem install -v <version> rubocop-rails

" typescript
" install commands
" $ npm install -g typescript typescript-language-server

" flowtype
" install commands
" $ npm install -g flow-language-server
" $ npm install -g flow-bin@0.108.0
" $ npm install -g flow-typed@2.6.2

" lua
" install commands
" $ brew install ninja
" Please install bellow command of web page.
" https://github.com/sumneko/lua-language-server/wiki/Build-and-Run-(Standalone)
"
" trouble Shoot
" > FormulaUnavailableError: No available formula with the name "/usr/local/opt/avr-gcc@7/.brew/avr-gcc@7.rb".
" $ brew install avr-gcc@7

" diagnostic
" ref: https://qiita.com/hrsh7th@github/items/7b9670adf3d8328fe2d8
" $ brew install efm-langserver

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gl <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>

" execute all formatCommand
" ref: https://github.com/neovim/neovim/pull/14462
" autocmd BufWritePre *.js lua vim.lsp.buf.formatting_seq_sync(nil, 100, nil)
" autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_seq_sync(nil, 100, nil)
" autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_seq_sync(nil, 100, nil)
" autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_seq_sync(nil, 100, nil)
" autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)

" nvim-lspconfig
lua << EOF
require'lspconfig'.tsserver.setup{
  -- filetypes = {'typescript', 'typescript.tsx', 'typescriptreact'}
  settings = {documentFormatting = false}
}
require'lspconfig'.solargraph.setup{
  init_options = {codeAction = false},
  filetypes = {"ruby", "rakefile", "rspec"},
  settings = {
      solargraph = {
          completion = true,
          diagnostic = true,
          folding = true,
          references = true,
          rename = true,
          symbols = true
      }
  }
}
require'lspconfig'.flow.setup{}
require'lspconfig'.yamlls.setup{}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.pyright.setup{}

-- efm
local eslint = {
  lintCommand = "./node_modules/.bin/eslint --stdin --stdin-filename ${INPUT}",
  lintIgnoreExitCode = true,
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  formatCommand = "./node_modules/.bin/eslint --fix ${INPUT}",
  formatStdin = true
}
require "lspconfig".efm.setup {
    init_options = {documentFormatting = true, codeAction = false},
    filetypes = {"javascriptreact", "javascript", "typescript","typescriptreact"},
    settings = {
        rootMarkers = {".git/"},
        languages = {
            javascript = {
                eslint
            },
            javascriptreact = {
                eslint
            },
            typescript = {
                eslint
            },
            typescriptreact = {
                eslint
            },
        }
    }
}

-- lua
local system_name
if vim.fn.has("mac") == 1 then
  system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
  system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
  system_name = "Windows"
else
  print("Unsupported system for sumneko")
end

-- get home directory
local handle = io.popen('echo $HOME')
local home_path = handle:read("*a")
handle:close()

-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local sumneko_root_path = home_path:sub(0, -2) .. '/.ghq/src/github.com/sumneko/lua-language-server'
local sumneko_binary = sumneko_root_path.."/bin/"..system_name.."/lua-language-server"

require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"};
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
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

nnoremap <silent>gc <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>

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

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')

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
