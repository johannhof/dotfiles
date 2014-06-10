source ~/.git-completion.bash

alias mongo1='mongod --port 27017 --dbpath /usr/local/var/mongodb/rs0-0 --replSet rs0'
alias mongo2='mongod --port 27018 --dbpath /usr/local/var/mongodb/rs0-1 --replSet rs0'
alias mongo3='mongod --port 27019 --dbpath /usr/local/var/mongodb/rs0-2 --replSet rs0'

export GOPATH="$HOME/Development/go"
export PATH=$PATH:$GOPATH/bin

export PATH=$(brew --prefix ruby)/bin:$PATH

alias pss='python -m SimpleHTTPServer'

alias fs_spaeti='sshfs spaeti@spaeti.pavo.uberspace.de:/home/spaeti/ ~/ftp/'

export DBURL=http://127.0.0.1:5984/

#export NXJ_HOME="/Users/johann/leJOS_NXJ"
export LEJOS_NXT_JAVA_HOME="/System/Library/Frameworks/JavaVM.framework/Versions/1.6.0/Home"
#export PATH="$NXJ_HOME/bin:$PATH"

export PATH=$PATH:~/bin

# player/stage paths
#export DYLD_LIBRARY_PATH=/Users/johann/stg/lib
export STAGEPATH=/usr/local/lib

# Setting PATH for Python 2.7
# The orginal version is saved in .bash_profile.pysave
# PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
# export PATH
# export PATH=/usr/local/bin:/Library/Frameworks/Python.framework/Versions/2.7/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin

##
# Your previous /Users/johann/.bash_profile file was backed up as /Users/johann/.bash_profile.macports-saved_2014-02-28_at_19:29:07
##

# MacPorts Installer addition on 2014-02-28_at_19:29:07: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
