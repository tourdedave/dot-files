#!/bin/bash

#Initialize submodules
git submodule init; git submodule update;

curr_dir=`pwd`

rm -rf $HOME/.vim
ln -s $curr_dir/vim $HOME/.vim

rm $HOME/.vimrc
ln -s $HOME/.vim/vimrc $HOME/.vimrc

rm $HOME/.bashrc
ln -s $curr_dir/bash/bashrc $HOME/.bashrc

rm $HOME/.bash_profile
ln -s $curr_dir/bash/bash_profile $HOME/.bash_profile

rm $HOME/.irbrc
ln -s $curr_dir/irbrc $HOME/.irbrc

rm $HOME/.rbenv
ln -s $curr_dir/rbenv $HOME/.rbenv

touch $HOME/.baseline_dotfiles

rm $HOME/.gitconfig
ln -s $curr_dir/gitconfig $HOME/.gitconfig

rm $HOME/.tmux.conf
ln -s $curr_dir/tmux $HOME/.tmux.conf
