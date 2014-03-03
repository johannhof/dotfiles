source ~/.git-completion.bash

alias mongo1='mongod --port 27017 --dbpath /usr/local/var/mongodb/rs0-0 --replSet rs0'
alias mongo2='mongod --port 27018 --dbpath /usr/local/var/mongodb/rs0-1 --replSet rs0'
alias mongo3='mongod --port 27019 --dbpath /usr/local/var/mongodb/rs0-2 --replSet rs0'

alias pss='python -m SimpleHTTPServer'

alias fs_kings='sshfs spaeti@spaeti.pavo.uberspace.de:/home/spaeti/node/kings ~/ftp/'

export DBURL=http://127.0.0.1:5984/

export PATH="$PATH":~/bin

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
