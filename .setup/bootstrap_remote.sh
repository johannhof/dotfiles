#!/bin/bash

#if apt-get install fish; then
  #echo "Installed fish via apt-get"
#elif ~/.setup/fish_shell_local_install.sh; then
  #echo "Installed fish via local checkout"
#else
  #echo "Unable to install fish"
#fi

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
