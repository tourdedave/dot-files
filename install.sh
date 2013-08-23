#!/bin/bash

#Initialize submodules
git submodule init; git submodule update;

curr_dir=`pwd`

ln -s $curr_dir/vim ~/.vim
ln -s ~/.vim/vimrc ~/.vimrc

ln -s $curr_dir/bash/bashrc ~/.bashrc
ln -s $curr_dir/bash/bash_profile ~/.bash_profile

touch ~/.baseline_dotfiles
