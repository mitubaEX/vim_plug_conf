" vim plug config
source $HOME/plugins/plugins.vim

" nvim config
source $HOME/.config/nvim/config/keybinds.vim
source $HOME/.config/nvim/config/set.vim
source $HOME/.config/nvim/config/color.vim
source $HOME/.config/nvim/config/util_script.vim
source $HOME/.config/nvim/config/fzf_functions.vim
source $HOME/.config/nvim/config/plugin_config.vim
source $HOME/.config/nvim/config/lsp_config.vim

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "vue" },  -- list of language that will be disabled
  },
  indent = {
    enable = true, -- これを設定することでtree-sitterによるインデントを有効にできます
  },
}
EOF

lua << EOF
require'lspconfig'.tsserver.setup{}
require'lspconfig'.solargraph.setup{}
EOF
" Use completion-nvim in every buffer
autocmd BufEnter * lua require'completion'.on_attach()

" open spec template
autocmd BufNewFile *_spec.rb 0r ~/.config/nvim/template/template_spec.rb

" remove all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
