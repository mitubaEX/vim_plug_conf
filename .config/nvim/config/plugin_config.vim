" floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1
let g:floaterm_width=0.8
let g:floaterm_height=0.8

" accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> e <Plug>CamelCaseMotion_e
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" tagalong.vim
let g:tagalong_filetypes = ['html', 'xml', 'jsx', 'eruby', 'ejs', 'eco', 'php', 'htmldjango', 'javascriptreact', 'typescriptreact', 'javascript']
let g:tagalong_verbose = 1

" alvan/vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js,*.tsx'
let g:closetag_filetypes = 'html,xhtml,phtml,javascript,javascriptreact,typescript,typescriptreact'

" brooth/far.vim
" Usage:
" :Far <search_word> <replace word> **/*
" :Fardo
let g:far#source = 'rg'

" vim-test/vim-test
let test#ruby#rspec#options = {
  \ 'nearest': '--backtrace',
  \ 'file':    '--format documentation',
  \ 'suite':   '--tag ~slow',
\}
let test#strategy = 'neovim'

" pechorin/any-jump.vim {{{
" Show line numbers in search rusults
let g:any_jump_list_numbers = 0

" Auto search references
let g:any_jump_references_enabled = 1

" Auto group results by filename
let g:any_jump_grouping_enabled = 0

" Amount of preview lines for each search result
let g:any_jump_preview_lines_count = 5

" Max search results, other results can be opened via [a]
let g:any_jump_max_search_results = 10

" Prefered search engine: rg or ag
let g:any_jump_search_prefered_engine = 'rg'

" Search results list styles:
" - 'filename_first'
" - 'filename_last'
let g:any_jump_results_ui_style = 'filename_first'

" Any-jump window size & position options
let g:any_jump_window_width_ratio  = 0.6
let g:any_jump_window_height_ratio = 0.6
let g:any_jump_window_top_offset   = 4

" Or override all default colors
let g:any_jump_colors = {
      \"plain_text":         "Comment",
      \"preview":            "Comment",
      \"preview_keyword":    "Operator",
      \"heading_text":       "Function",
      \"heading_keyword":    "Identifier",
      \"group_text":         "Comment",
      \"group_name":         "Function",
      \"more_button":        "Operator",
      \"more_explain":       "Comment",
      \"result_line_number": "Comment",
      \"result_text":        "Statement",
      \"result_path":        "String",
      \"help":               "Comment"
      \}

" Disable default any-jump keybindings (default: 0)
let g:any_jump_disable_default_keybindings = 1

" Remove comments line from search results (default: 1)
let g:any_jump_remove_comments_from_results = 1

" Custom ignore files
" default is: ['*.tmp', '*.temp']
let g:any_jump_ignored_files = ['*.tmp', '*.temp']

" Search references only for current file type
" (default: false, so will find keyword in all filetypes)
let g:any_jump_references_only_for_current_filetype = 0

" Disable search engine ignore vcs untracked files
" (default: false, search engine will ignore vcs untracked files)
let g:any_jump_disable_vcs_ignore = 0

" disable default key map
let g:any_jump_disable_default_keybindings = 1
" }}}

" t9md/vim-quickhl
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)

" mhinz/vim-startify
let g:startify_lists = [
\ { 'type': 'files',     'header': ['   MRU']            },
  \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
  \ { 'type': 'sessions',  'header': ['   Sessions']       },
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
  \ { 'type': 'commands',  'header': ['   Commands']       },
  \ ]
let g:startify_bookmarks = [ {'c': '~/.config/nvim/init.vim'}, '~/.zshrc' ]

" yuttie/comfortable-motion.vim
let g:comfortable_motion_friction = 200
let g:comfortable_motion_air_drag = 4.0

" osyo-manga/vim-operator-stay-cursor
" yank時カーソル移動しないやつ
" map <expr> y operator#stay_cursor#wrapper("y")

" gelguy/wilder.nvim {{
call wilder#enable_cmdline_enter()
set wildcharm=<Tab>
cmap <expr> <Tab> wilder#in_context() ? wilder#next() : "\<Tab>"
cmap <expr> <S-Tab> wilder#in_context() ? wilder#previous() : "\<S-Tab>"
" only / and ? is enabled by default
call wilder#set_option('modes', ['/', '?', ':'])
" }}

"fern {{{
" in millisecond, used for both CursorHold and CursorHoldI,
" use updatetime instead if not defined
let g:cursorhold_updatetime = 100
let g:fern#hide_cursor = 'hide'
let g:fern#renderer = "nerdfont"
"}}}

" chrisbra/csv
let g:csv_delim=','
let g:csv_highlight_column = 'y'
unlet g:csv_highlight_column
let g:csv_hiGroup = 'Visual'

" matze/vim-move
let g:move_key_modifier = 'C'

" telescope
" Find files using Telescope command-line sugar.
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    -- please install fzy
    file_sorter = require'telescope.sorters'.get_fzy_sorter,
    generic_sorter = require'telescope.sorters'.get_fzy_sorter,
    mappings = {
      i = {
        ["<c-p>"] = actions.preview_scrolling_up,
        ["<c-n>"] = actions.preview_scrolling_down,

        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
      },
      n = {
        ["<esc>"] = actions.close,
      },
    },
  },
  pickers = {
    -- Your special builtin config goes in here
    buffers = {
      sort_lastused = true,
    },
  },
}
EOF

" lualine {{{
lua << EOF
require('lualine').setup{
  options = {
    theme = 'iceberg_dark',
    icons_enabled = true,
  },
  sections = {
    lualine_a = { {'mode', upper = true} },
    lualine_b = { {'branch', icon = ''} },
    lualine_c = {
      {'filename', file_status = true, path = 1, separator = ''},
      { 'diff', separator = '', icon = '✏️ :' }, {
      -- Lsp server name .
      -- ref: https://gist.github.com/shadmansaleh/cd526bc166237a5cbd51429cc1f6291b
      function ()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_buf_get_option(0,'filetype')
        local clients = vim.lsp.get_active_clients()
        if next(clients) == nil then return msg end

        client_table = {}
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            table.insert(client_table,  client.name)
          end
        end

        if table.getn(client_table) > 0 then
          return '[' .. table.concat(client_table, ',') .. ']'
        end

        return msg
      end,
      icon = '⚙️ :',
      color = {fg = '#a69ded'},
      separator = ''
    }, {'diagnostics', sources = {'nvim_lsp'}, icon = '🚦:'}, {
      function ()
        return vim.b.vista_nearest_method_or_function
      end,
      icon = 'ƒ:'
    }},
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location'  },
  },
  inactive_sections = {
    lualine_a = {  },
    lualine_b = {  },
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {  },
    lualine_z = {  },
  },
}
EOF
" }}}

lua << EOF
require('nvim_comment').setup()
EOF

" memolist
let g:memolist_path = "~/.memolist"

" folke/lsp-trouble.nvim {{{
lua << EOF
require("trouble").setup {}
EOF
nnoremap <leader>xx <cmd>LspTroubleToggle<cr>
" }}}

" lewis6991/gitsigns.nvim
lua << EOF
require('gitsigns').setup {
  current_line_blame = true,
}
EOF

" mitubaEX/blame_open.nvim
let g:blame_open_upstream_remote = 1

" nacro90/numb.nvim
lua << EOF
-- require('numb').setup()
EOF

" pwntester/octo.nvim
lua << EOF
-- require("octo").setup()
EOF

" vim-ruby
let ruby_no_expensive = 1

" rmagatti/goto-preview
lua << EOF
require('goto-preview').setup {
  default_mappings = true,
  current_line_blame_delay = 200,
}
EOF

" phaazon/hop.nvim
highlight default HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold
highlight default HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=bold
highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33
highlight default HopUnmatched guifg=#666666 ctermfg=242

" folke/zen-mode.nvim
lua << EOF
  require("zen-mode").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF
