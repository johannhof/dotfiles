#!/bin/bash

####
# Setup script for my unixy work environment.
# I found myself switching computers a lot recently and thought this would be a good thing to have.
# Should not break anything if run multiple times or on an non-blank system, but rather quietly install all missing parts.
####

# TODO assumes Linux=Debian/Ubuntu and has apt-get

# add fish shell repo
sudo add-apt-repository ppa:fish-shell/release-4
sudo apt update

# install various things
sudo apt-get install build-essential vim curl git fish fortune tmux

# install node version manager
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# add tmux plugins
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# install rust via rustup
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
