#!/bin/bash

####
# Setup script for my unixy work environment.
# I found myself switching computers a lot recently and thought this would be a good thing to have.
# Should not break anything if run multiple times or on an non-blank system, but rather quietly install all missing parts.
####

# TODO assumes Linux=Debian/Ubuntu and has apt-get

if [ "$(uname)" == "Darwin" ]; then
    OSX=true
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    LINUX=true
else
    echo "OS not recognized"
    exit 1
fi

# update apt-get
if [ "$LINUX" = true ]; then
    sudo apt-get update
fi

# install homebrew
if [ "$LINUX" = true ]; then
  sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
fi
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# install wget
if [ "$OSX" = true ]; then
    brew install wget
fi

# install git
if [ "$OSX" = true ]; then
    brew install git
elif [ "$LINUX" = true ]; then
    sudo apt-get install git
fi

# install mercurial
if [ "$OSX" = true ]; then
    brew install mercurial
elif [ "$LINUX" = true ]; then
    sudo apt-get install mercurial
fi

# install vim
if [ "$LINUX" = true ]; then
    sudo apt-get install vim
fi

# install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# install fish shell
brew install fish

# Install cmake
brew install cmake

# install node version manager
curl https://raw.githubusercontent.com/creationix/nvm/v0.29.0/install.sh | bash

# install erlang
# brew install erlang

# install elixir
# brew install elixir

# sshrc
brew install sshrc

# install rust via rustup
curl https://sh.rustup.rs -sSf | sh

# im/gm
brew install imagemagick graphicsmagick

# install ripgrep
brew install ripgrep

# install fd
brew install fd

brew install fortune
brew install cowsay
