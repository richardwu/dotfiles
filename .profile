local UNI_TERM=2B
alias uni="cd $HOME/Dropbox/uni-courses/$UNI_TERM"
export EDITOR=vim

#override file commands
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"

# custom alias
alias code="cd ~/Programming"

# added by Anaconda3 5.0.1 installer
export PATH="/Users/$USER/anaconda3/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

alias gogogo="cd $GOPATH"

# CockroachDB
export ROACH="$GOPATH/src/github.com/cockroachdb/cockroach"
export ROACH_SCRIPTS_DIR="$HOME/scripts/cockroach"

alias goroach="cd $ROACH; pwd"
alias startroach="sh $ROACH_SCRIPTS_DIR/start-cluster.sh"

export PATH="$GOPATH/src/github.com/cockroachlabs/production/crl-prod:$PATH"
export PATH="$GOPATH/src/github.com/richardwu/roach-bench:$PATH"

# Halite 2

export PATH="/Users/$USER/Programming/halite2/hlt_client/hlt_client:$PATH"

which rbenv > /dev/null
if [ $? -eq 0 ]; then
  eval "$(rbenv init -)"
fi

# Vim with clipboard
alias vim='/Applications/MacVim.app/Contents/MacOS/Vim'

# This needs to be last: ccache: caches C compiler outputs
export PATH="/usr/local/opt/ccache/libexec:$PATH"

