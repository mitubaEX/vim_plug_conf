" floaterm
let g:floaterm_gitcommit='floaterm'
let g:floaterm_wintitle=0
let g:floaterm_autoclose=1

" accelerated-jk
nmap j <Plug>(accelerated_jk_gj)
nmap k <Plug>(accelerated_jk_gk)

" quickrun
let g:quickrun_config = {
\   'haskell' : { 'type' : 'haskell/stack' },
\   'haskell/stack' : {
\       'command' : 'stack',
\       'exec' : '%c %o %s %a',
\       'cmdopt' : 'runghc',
\   },
\   'go': {
\     'command': 'go',
\     'exec': '%c run %a',
\     'args': '**/*.go',
\     'tempfile': '%{tempname()}.go',
\     'hook/output_encode/encoding': 'utf-8',
\     'hook/cd/directory': '%S:p:h',
\   },
\}

" rhysd/vim-operator-surround
" saiw(: aaa -> (aaa)
map <silent>sa <Plug>(operator-surround-append)

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
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

" Customize any-jump colors with extending default color scheme:
" let g:any_jump_colors = { "help": "Comment" }

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
map <expr> y operator#stay_cursor#wrapper("y")

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
let g:fern#smart_cursor = 'hide'
let g:fern#renderer = "nerdfont"
"}}}

" chrisbra/csv
let g:csv_delim=','
let g:csv_highlight_column = 'y'
let g:csv_hiGroup = 'Visual'

" SirVer/ultisnips
let g:UltiSnipsExpandTrigger="<c-f>"
let g:UltiSnipsJumpForwardTrigger="<c-e>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" itchyny/lightline.vim {{{
" ref: https://kitagry.github.io/blog/programmings/2020/08/lightline-vim-lsp/
function! LightlineLSPWarnings() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.warning == 0 ? '' : printf('W:%d', l:counts.warning)
endfunction

function! LightlineLSPErrors() abort
  let l:counts = lsp#get_buffer_diagnostics_counts()
  return l:counts.error == 0 ? '' : printf('E:%d', l:counts.error)
endfunction

function! LightlineLSPOk() abort
  let l:counts =  lsp#get_buffer_diagnostics_counts()
  let l:total = l:counts.error + l:counts.warning
  return l:total == 0 ? '' : ''
endfunction

augroup LightLineOnLSP
  autocmd!
  autocmd User lsp_diagnostics_updated call lightline#update()
augroup END

set noshowmode
let g:lightline = {
     \ 'separator': { 'left': '', 'right': '' },
     \ 'subseparator': { 'left': '', 'right': '' },
     \ 'tabline': {
     \   'left': [['tabs']],
     \   'right': [['close'], ['gitbranch', 'wifi', 'battery']],
     \ },
     \ 'active': {
     \   'left': [
     \     ['mode', 'paste'],
     \     [ 'gitbranch', 'readonly', 'filename', 'modified' ],
     \     [ 'lsp_errors', 'lsp_warnings', 'lsp_ok' ],
     \   ],
     \   'right': [
     \     [ 'lineinfo' ],
     \     [ 'percent' ],
     \     [ 'fileformat', 'fileencoding', 'filetype', 'charvaluehex' ],
     \  ],
     \ },
     \ 'component': {
     \   'charvaluehex': '0x%B'
     \ },
     \ 'component_function': {
     \   'cwd': 'getcwd',
     \   'wifi': 'wifi#component',
     \   'battery': 'battery#component',
     \   'gitbranch': 'fugitive#head',
     \   'filename': 'LightLineFilename',
     \ },
     \ 'component_expand': {
     \   'lsp_warnings': 'LightlineLSPWarnings',
     \   'lsp_errors':   'LightlineLSPErrors',
     \   'lsp_ok':       'LightlineLSPOk',
     \ },
     \ 'component_type': {
     \   'lsp_warnings': 'warning',
     \   'lsp_errors':   'error',
     \   'lsp_ok':       'middle',
     \ },
     \ }

function! LightLineFilename()
  return expand('%')
endfunction
" }}}

" matze/vim-move
let g:move_key_modifier = 'C'

" coc
let g:coc_global_extensions = [
  \ 'coc-eslint',
  \ 'coc-prettier',
  \ ]

" coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
let b:coc_suggest_disable = 1

" telescope
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap ; <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case'
    },
    prompt_position = "top",
    prompt_prefix = "> ",
    selection_caret = "> ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_defaults = {
      horizontal = {
        mirror = false,
      },
      vertical = {
        mirror = false,
      },
    },
    file_sorter =  require'telescope.sorters'.get_fuzzy_file,
    file_ignore_patterns = {},
    generic_sorter =  require'telescope.sorters'.get_generic_fuzzy_sorter,
    shorten_path = true,
    winblend = 0,
    width = 0.75,
    preview_cutoff = 120,
    results_height = 1,
    results_width = 0.8,
    border = {},
    borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' },
    color_devicons = true,
    use_less = true,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,

    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require'telescope.previewers'.buffer_previewer_maker,

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
  }
}
EOF
