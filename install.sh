#!/bin/sh

# create zsh symlinks
ln -s ~/dev/dotfiles/zsh/.zprofile ~/.zprofile
ln -s ~/dev/dotfiles/zsh/.zshrc ~/.zshrc

# create neovim symlinks
mkdir ./config/nvim
mkdir ./config/nvim/autoload
mkdir ./config/nvim/plugged

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/dev/dotfiles/config/nvim/init.vim ~/.config/nvim/init.vim

