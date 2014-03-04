curr_dir=`pwd`

# pull in plugins
git submodule init; git submodule update;

# vim
rm -rf $HOME/.vim
cp -rf $curr_dir/vim $HOME/.vim
rm $HOME/.vimrc
cp $curr_dir/vimrc $HOME/.vimrc

# bash
rm $HOME/.bashrc
cp $curr_dir/bash/bashrc $HOME/.bashrc
rm $HOME/.bash_profile
cp $curr_dir/bash/bash_profile $HOME/.bash_profile

# irb
rm $HOME/.irbrc
cp $curr_dir/irbrc $HOME/.irbrc

# git
rm $HOME/.gitconfig
cp $curr_dir/git/gitconfig $HOME/.gitconfig

# tmux
rm $HOME/.tmux.conf
cp $curr_dir/tmux $HOME/.tmux.conf
