mkdir -p $HOME/.config/nvim

ln -sf $(pwd)/.config/nvim/init.vim $HOME/.config/nvim/init.vim

# vim plug
mkdir -p $HOME/plugins
find plugins -type f | xargs -I% ln -sf $(pwd)/% $HOME/%
