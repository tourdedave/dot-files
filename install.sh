#!/bin/bash

#Initialize submodules
git submodule init; git submodule update;

curr_dir=`pwd`

[[ -d $HOME/.vim ]] && mv $HOME/.vim $HOME/.vim.backup
ln -s $curr_dir/vim $HOME/.vim

[[ -f $HOME/.vimrc ]] && mv $HOME/.vimrc $HOME/.vimrc.backup
ln -s $HOME/.vim/vimrc $HOME/.vimrc

[[ -d $HOME/.bashrc ]] && mv $HOME/.bashrc $HOME/.bashrc.backup
ln -s $curr_dir/bash/bashrc ~/.bashrc

[[ -d $HOME/.bash_profile ]] && mv $HOME/.bash_profile $HOME/.bash_profile.backup
ln -s $curr_dir/bash/bash_profile ~/.bash_profile

OS=`uname -s`
if [[ "$OS" != "Darwin" ]]; then
  cd $HOME
  curl -L https://gist.github.com/bltavares/2706792/raw/post-install.sh | bash
fi

touch $HOME/.baseline_dotfiles
