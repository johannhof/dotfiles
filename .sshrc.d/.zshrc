source $SSHHOME/.sshrc.d/antigen.zsh

antigen use oh-my-zsh

# theme
antigen theme pygmalion

antigen apply

# plugins
antigen bundles <<EOBUNDLES
  # esc twice to put sudo in front
  sudo

  # git
  git

  # Guess what to install when running an unknown command.
  command-not-found

EOBUNDLES
