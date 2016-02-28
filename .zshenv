export LANG=en_US.UTF-8

##### PATH #####

export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin"

# GOPATH
export GOPATH=~/Development/go
export PATH=$PATH:$GOPATH/bin

# Elixir
export PATH=$PATH:~/elixir/bin

# Linuxbrew
export PATH=$PATH:~/.linuxbrew/bin

# Ruby
export PATH=$PATH:$(brew --prefix ruby)/bin

# Julia
export PATH=$PATH:/Applications/Julia-0.3.5.app/Contents/Resources/julia/bin

# Rust binaries
export PATH=$PATH:~/.multirust/toolchains/stable/cargo/bin

# Postgres for Mac
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/9.4/bin

export PATH=$PATH:~/bin

export PATH=$PATH:/Applications/Android\ Studio.app/sdk/platform-tools

export MONO_GAC_PREFIX="/usr/local"

export RUST_SRC_PATH="$HOME/Development/rust/src/"

# even faster typing
export KEYTIMEOUT=1
