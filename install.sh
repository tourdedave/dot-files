#!/bin/bash

#Initialize submodules
git submodule init; git submodule update;

curr_dir=`pwd`

ln -s $curr_dir/vim $HOME/.vim
ln -s $HOME/.vim/vimrc $HOME/.vimrc

touch $HOME/.baseline_dotfiles
