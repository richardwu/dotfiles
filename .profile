### Configs

# Disable Ctrl-S from freezing vim
stty -ixon

### Exports

export uni="$HOME/Dropbox/uni-courses/4b"
export oldcode="$HOME/Programming"
export code="$HOME/BigProgramming"
export box="$HOME/Dropbox"
export web="$code/richardwu.github.io"

export EDITOR=vim

# Postgres
export PGDATA='/usr/local/pgsql/data'

### Alias

# file commands
alias rm="rm -iv"
alias mv="mv -iv"
alias cp="cp -iv"
# git
alias gma="git add"
alias gmc="git commit"
alias gmd="git diff"
alias gml="git log"
alias gms="git st"
alias gmpl="git pull"
alias gmps="git push"
alias gmr="git rebase"
# conda
alias sact="source activate"
alias cenv="conda env list"

### PATH

export PATH="/$HOME/anaconda3/bin:$PATH"

# Go
export GOPATH="$HOME/go"            # GOPATH specifies workspace for non-standard library go packages i.e. your own packages
export GOROOT="/usr/local/go"       # GOROOT specifies the directory where the go standard library is installed
export PATH="$PATH:$GOROOT/bin"
# Bash v4
export PATH="/usr/local/bin/bash:$PATH"
# Haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"
# This needs to be last: ccache: caches C compiler outputs
export PATH="/usr/local/opt/ccache/libexec:$PATH"

### Plugin specifics

# rbenv
which rbenv > /dev/null
if [ $? -eq 0 ]; then
  eval "$(rbenv init -)"
fi
# fzf
if [ -f ~/.fzf.zsh ]; then
  source ~/.fzf.zsh
fi
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

# added by Anaconda3 2019.07 installer
# >>> conda init >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$(CONDA_REPORT_ERRORS=false '/Users/rwu1997/anaconda3/bin/conda' shell.bash hook 2> /dev/null)"
if [ $? -eq 0 ]; then
    \eval "$__conda_setup"
else
    if [ -f "/Users/rwu1997/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/rwu1997/anaconda3/etc/profile.d/conda.sh"
        CONDA_CHANGEPS1=false conda activate base
    else
        \export PATH="/Users/rwu1997/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda init <<<

set -o ignoreeof
