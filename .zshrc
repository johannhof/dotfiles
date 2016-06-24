source $HOME/.antigen/antigen.zsh

DEFAULT_USER=johann

antigen use oh-my-zsh

# theme
antigen theme $HOME/.themes/ johann

# plugins
antigen bundles <<EOBUNDLES
  # esc twice to put sudo in front
  sudo

  # git
  git

  # mercurial
  mercurial

  # bookmarking
  jocelynmallon/zshmarks

  # ZSH port of Fish shell's history search feature.
  zsh-users/zsh-history-substring-search

  # Syntax highlighting bundle.
  zsh-users/zsh-syntax-highlighting

EOBUNDLES

antigen apply

###### ALIASES #####

# alias to jump to bookmarks fast
alias j='jump'

## super quick server
alias pss='python -m SimpleHTTPServer'

## apt-get shortcuts
alias agi='sudo apt-get install'
alias agu='sudo apt-get update'
alias agr='sudo apt-get remove'

## rust
alias ct='cargo test'
alias cr='cargo run'

alias hgw='hg wip'

# run .exe with mono
alias -s exe=mono

## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
