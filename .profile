export CODE=$HOME/Desktop/Programming
local UNI_TERM=2B
export UNI=$HOME/Dropbox/uni-courses/$UNI_TERM
export EDITOR=vim

#sublime
alias sub="open $1 -a \"Sublime Text 2\""

#override file commands
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"

# PATH additions

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# MacPorts Installer addition on 2015-11-10_at_10:45:35: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# added by Anaconda3 4.3.1 installer
export PATH="/Users/rwu1997/anaconda3/bin:$PATH"

# ccache: caches C compiler outputs
export PATH="/usr/local/opt/ccache/libexec:$PATH"

# Go
export GOPATH="$HOME/go"

# CockroachDB
export ROACH="$GOPATH/src/github.com/cockroachdb/cockroach"
export ROACH_SCRIPTS_DIR="$HOME/scripts/cockroach"

alias goroach="cd $ROACH; pwd"
alias startroach="sh $ROACH_SCRIPTS_DIR/start-cluster.sh"

export PATH="/Users/richardwu/go/src/github.com/cockroachlabs/production/crl-prod:$PATH"
export PATH="/Users/richardwu/go/src/golang.org/x/perf/cmd/benchstat:$PATH"
