# rm config
rm $HOME/.config/nvim/init.vim
rm -rf $HOME/plugins
rm -rf $HOME/.config/nvim/config

mkdir -p $HOME/.config/nvim

ln -sf $(pwd)/.config/nvim/init.vim $HOME/.config/nvim/init.vim

# vim plug
mkdir -p $HOME/plugins
find plugins -type f | xargs -I% ln -sf $(pwd)/% $HOME/%

# nvim config
mkdir -p $HOME/.config/nvim/config
find .config -type f | xargs -I% ln -sf $(pwd)/% $HOME/%

# vsnip
mkdir -p $HOME/.vsnip
find .vsnip -type f | xargs -I% ln -sf $(pwd)/% $HOME/%
