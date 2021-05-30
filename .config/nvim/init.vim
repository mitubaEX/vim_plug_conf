" vim plug config
source $HOME/plugins/plugins.vim

" nvim config
source $HOME/.config/nvim/config/keymap.vim
source $HOME/.config/nvim/config/set.vim
source $HOME/.config/nvim/config/color.vim
source $HOME/.config/nvim/config/fzf_functions.vim
source $HOME/.config/nvim/config/plugin_config.vim
source $HOME/.config/nvim/config/lsp_config.vim

" polyglot(vim-markdown)
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_conceal = 0

" typescript file type
autocmd bufnewfile,bufread *.tsx set filetype=typescriptreact
autocmd bufnewfile,bufread *.jsx set filetype=javascriptreact

" rspec filetype
autocmd bufnewfile,bufread *_spec.rb set filetype=rspec

" open spec template
autocmd BufNewFile *_spec.rb 0r ~/.config/nvim/template/template_spec.rb

" remove all trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" reload tsx file
" NOTE: When update eslint, this option become unnecessary.
autocmd BufWritePre *.tsx e %

" treesitter
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
  indent = {
    enable = false
  },
}
EOF
