#!/bin/bash

####
# Setup script for my unixy work environment.
# I found myself switching computers a lot recently and thought this would be a good thing to have.
# Should not breaking anything if run multiple times or on an non-blank system, but rather quietly install all missing parts.
####

# NOTE: this uses curl | sh excessively as I'm not really scared of huge open source
# projects injecting malicious code the moment I install this thing on my computer.

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
if [ "$OSX" = true ]; then
    ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
elif [ "$LINUX" = true ]; then
    sudo apt-get install build-essential curl git m4 ruby texinfo libbz2-dev libcurl4-openssl-dev libexpat-dev libncurses-dev zlib1g-dev
    ruby -e "$(wget -O- https://raw.github.com/Homebrew/linuxbrew/go/install)"
fi

# install wget
if [ "$OSX" = true ]; then
    brew install wget
fi

# install git
if [ "$OSX" = true ]; then
    brew install git git-flow
elif [ "$LINUX" = true ]; then
    sudo apt-get install git git-flow
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

# install vundle
if [ ! -d "~/.vim/bundle/vundle" ]; then
  git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

# install zsh
if [ "$OSX" = true ]; then
    brew install zsh
elif [ "$LINUX" = true ]; then
    sudo apt-get install zsh
fi

# install node version manager
curl https://raw.githubusercontent.com/creationix/nvm/v0.24.1/install.sh | bash

# install go version manager
zsh < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)

# install nvim
brew tap neovim/homebrew-neovim
brew install --HEAD neovim

# install erlang
brew install erlang

# install elixir
brew install elixir

# install rust via multirust
curl -sf https://raw.githubusercontent.com/brson/multirust/master/blastoff.sh | sh

# casperjs
brew install casperjs --devel

# im/gm
brew install imagemagick graphicsmagick

# cfx
brew install mozilla-addon-sdk
