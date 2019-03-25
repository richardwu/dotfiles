export uni="$HOME/Dropbox/uni-courses/4b"
export code="$HOME/Programming"
export box="$HOME/Dropbox"
export web="$code/richardwu.github.io"

export EDITOR=vim

#override file commands
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"

# added by Anaconda3 2018.12 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false "/$HOME/anaconda3/bin/conda" shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/$HOME/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

# Go
export GOPATH="$HOME/go"            # GOPATH specifies workspace for non-standard library go packages i.e. your own packages
export GOROOT="/usr/local/go"       # GOROOT specifies the directory where the go standard library is installed
export PATH="$PATH:$GOROOT/bin"

alias gogogo="cd $GOPATH"

# CockroachDB
export ROACH="$GOPATH/src/github.com/cockroachdb/cockroach"
export ROACH_SCRIPTS_DIR="$HOME/scripts/cockroach"

alias goroach="cd $ROACH; pwd"
alias startroach="sh $ROACH_SCRIPTS_DIR/start-cluster.sh"

export PATH="$GOPATH/src/github.com/cockroachlabs/production/crl-prod:$PATH"
export PATH="$GOPATH/src/github.com/richardwu/roach-bench:$PATH"


# rbenv
which rbenv > /dev/null
if [ $? -eq 0 ]; then
  eval "$(rbenv init -)"
fi

# fzf
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi

# Postgres
export PGDATA='/usr/local/pgsql/data'

# Bash v4
export PATH="/usr/local/bin/bash:$PATH"

# Haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"

# Disable Ctrl-S from freezing vim
stty -ixon

# This needs to be last: ccache: caches C compiler outputs
export PATH="/usr/local/opt/ccache/libexec:$PATH"
