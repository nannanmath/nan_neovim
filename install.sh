#!/bin/bash
set -e

cd ~/.nan_neovim

echo "Install vim_plug ..."

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim 

echo "vim_plug install successfully!"

echo "
source ~/.nan_neovim/conf/setup.nvim
source ~/.nan_neovim/conf/base_conf.nvim
source ~/.nan_neovim/conf/plugins_conf.nvim
" > ~/.config/nvim/init.vim

echo "
# Neovim
if type nvim > /dev/null 2>&1; then
  alias vim='nvim'
fi
" >> ~/.bashrc

source ~/.bashrc

echo "Install Plugins ..."

nvim -u conf/setup.nvim +PlugInstall +qall

echo "Install successfully!"
