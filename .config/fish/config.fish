function nvm
  bash -c "source ~/.nvm/nvm.sh; nvm $argv"
end

# Git prompt settings
set -g __fish_git_prompt_showdirtystate 'yes'
set -g __fish_git_prompt_showstashstate 'yes'
set -g __fish_git_prompt_showuntrackedfiles 'yes'

# PATH

set -x PATH $PATH $HOME/bin

## Rust binaries
set -x PATH $PATH $HOME/.cargo/bin

## Chromium depot tools
set -x PATH $PATH $HOME/depot_tools/

## Android Studio
set -x PATH $PATH ~/Library/Android/sdk/platform-tools/
set -x PATH $PATH ~/Library/Android/sdk/emulator/

set -x -g LC_ALL en_US.UTF-8
set -x -g LANG en_US.UTF-8

source ~/.config/fish/fish_aliases

if test -f ~/.config/fish/local.fish
  source ~/.config/fish/local.fish
end
