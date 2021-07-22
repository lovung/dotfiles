#!/bin/bash
CONFIG='~/.config'

# Linked neovim config
rm -rf $CONFIG/nvim/init.vim $CONFIG/nvim/syntax
ln -s $(pwd)/nvim/init.vim $CONFIG/nvim/init.vim 
ln -s $(pwd)/nvim/syntax $CONFIG/nvim/syntax

# Profile (export and alias)
rm -rf ~/.profile
ln -s $(pwd)/.profile ~/.profile
source ~/.profile

# Zsh
rm -rf ~/.zshrc
ln -s $(pwd)/.zshrc ~/.zshrc
