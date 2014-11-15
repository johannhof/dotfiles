source .antigen/antigen.zsh

DEFAULT_USER=johann

antigen use oh-my-zsh

# theme
antigen theme $HOME/.themes/ johann

# plugins
antigen bundles <<EOBUNDLES
  brew
  coffee
  npm

  # Print pictures to the stdout
  catimg

  # https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins#osx
  osx

  # display a random quote using quote
  rand-quote

  # esc twice to put sudo in front
  sudo

  # git
  git
  bobthecow/git-flow-completion

  # Guess what to install when running an unknown command.
  command-not-found

  # bookmarking
  jocelynmallon/zshmarks

  # Helper for extracting different types of archives.
  extract

  # nicoulaj's moar completion files for zsh
  zsh-users/zsh-completions src

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

## nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

