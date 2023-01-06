### Configs

# Disable Ctrl-S from freezing vim
stty -ixon

### Exports

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

# Go
export GOPATH="$HOME/go"            # GOPATH specifies workspace for non-standard library go packages i.e. your own packages
export GOROOT="/usr/local/go"       # GOROOT specifies the directory where the go standard library is installed
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
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
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('$HOME/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$HOME/anaconda3/etc/profile.d/conda.sh" ]; then
        . "$HOME/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="$HOME/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

### conda shortcuts

alias cact="conda activate"
alias cdact="conda deactivate"

set -o ignoreeof

# Disable bell sound in less.
export LESS="$LESS -R -Q"

if [[ -f /proc/version ]] && [[ "$(< /proc/version)" == *microsoft* ]] ; then
  echo "original DISPLAY: $DISPLAY"
  # If DNS resolution fails, create a new file and symlink it to point to a fixed DNS host.
  export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
fi


### Yarn global bins.

if [[ "$(command -v yarn)" == "0" ]] && [[ -x "$(yarn global bin)" ]]; then
  export PATH="$(yarn global bin):$PATH"
fi

# Homebrew
[[ -s "/opt/homebrew/bin/brew" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"

# For settings local to the system.
if [ -f ~/.local.profile ]; then
  source ~/.local.profile
fi


# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*


### Rust

[[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

### Solana

export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

### Google cloud.

# The next line updates PATH for the Google Cloud SDK.
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

[[ -f "$HOME/.rover/env" ]] && source "$HOME/.rover/env"

export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

# NVM node version manager (should go last so default doesn't get reset).
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
