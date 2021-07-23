#!/bin/bash
CONFIG=$HOME'/.config'

# Linked neovim config -> Use stow
# rm -rf $CONFIG/nvim/init.vim $CONFIG/nvim/syntax
# ln -s $(pwd)/nvim/init.vim $CONFIG/nvim/init.vim 
# ln -s $(pwd)/nvim/syntax $CONFIG/nvim/syntax

# Linked kitty config
rm -rf $CONFIG/kitty/kitty.conf 
ln -s $(pwd)/kitty/kitty.conf $CONFIG/kitty/kitty.conf 

# Profile (export and alias)
rm -rf ~/.profile
ln -s $(pwd)/.profile ~/.profile
source ~/.profile

# Zsh
rm -rf ~/.zshrc
ln -s $(pwd)/.zshrc ~/.zshrc
