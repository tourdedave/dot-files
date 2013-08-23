#!/bin/bash

#Initialize submodules
git submodule init; git submodule update;

curr_dir=`pwd`

ln -s $curr_dir/vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

touch ~/.baseline_dotfiles
