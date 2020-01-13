# PATH

## Rust binaries
set -x PATH $PATH $HOME/.cargo/bin

## Postgres for Mac
set -x PATH $PATH /Applications/Postgres.app/Contents/Versions/latest/bin

## Android Studio
set -x PATH $PATH ~/Library/Android/sdk/platform-tools/
set -x PATH $PATH ~/Library/Android/sdk/emulator/

set -x -g LC_ALL en_US.UTF-8
set -x -g LANG en_US.UTF-8

source ~/.config/fish/fish_aliases
