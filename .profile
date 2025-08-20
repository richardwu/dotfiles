### Configs

# Disable Ctrl-S from freezing vim
stty -ixon

# For settings local to the system.
if [ -f ~/.local.profile ]; then
  source ~/.local.profile
fi


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
# dirs
alias ccode="$HOME/code"

# Go
export GOPATH="$HOME/go"            # GOPATH specifies workspace for non-standard library go packages i.e. your own packages
export GOROOT="/usr/local/go"       # GOROOT specifies the directory where the go standard library is installed
export PATH="$PATH:$GOROOT/bin:$GOPATH/bin"
# Local bins
export PATH="/$HOME/bin:$PATH"
# Bash v4
export PATH="/usr/local/bin/bash:$PATH"
# Haskell
export PATH="$HOME/Library/Haskell/bin:$PATH"
# SP1
export PATH="$PATH:/Users/richardwu/.sp1/bin"
# This needs to be last: ccache: caches C compiler outputs
export PATH="/usr/local/opt/ccache/libexec:$PATH"

# rbenv
which rbenv > /dev/null
if [ $? -eq 0 ]; then
  eval "$(rbenv init -)"
fi

set -o ignoreeof

# Disable bell sound in less.
export LESS="$LESS -R -Q"

if [[ -f /proc/version ]] && [[ "$(< /proc/version)" == *microsoft* ]] ; then
  echo "original DISPLAY: $DISPLAY"
  # This makes vim not open immediately anymore... not necessary?
  # If DNS resolution fails, create a new file and symlink it to point to a fixed DNS host.
  # export DISPLAY=$(cat /etc/resolv.conf | grep nameserver | awk '{print $2}'):0
fi

### Yarn global bins.
# export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

### Solana
export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"
# Anchor
export PATH="$HOME/.avm/bin:$PATH"

# gnu-tar for solana test-validator to work
export PATH="/opt/homebrew/opt/gnu-tar/libexec/gnubin:$PATH"

# export CPATH="/Library/Developer/CommandLineTools/SDKs/MacOSX.sdk/usr/include"

# Android studio
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH="$PATH:$ANDROID_HOME/emulator"
export PATH="$PATH:$ANDROID_HOME/platform-tools"

export PATH="/Users/richardwu/.local/share/solana/install/active_release/bin:$PATH"

# Added by Windsurf
export PATH="/Users/richardwu/.codeium/windsurf/bin:$PATH"

# Added by Risc0
export PATH="$PATH:/Users/richardwu/.risc0/bin"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/richardwu/.lmstudio/bin"

which aikido-npm > /dev/null
if [ $? -eq 0 ]; then
  echo "using aikido aliases"
  alias npm="aikido-npm" # Safe-chain alias for npm
  alias npx="aikido-npx" # Safe-chain alias for npx
  alias yarn="aikido-yarn" # Safe-chain alias for yarn
  alias pnpm="aikido-pnpm" # Safe-chain alias for pnpm
  alias pnpx="aikido-pnpx" # Safe-chain alias for pnpx
fi

### Function definitions

setup_fzf() {
  echo 'fzf'
  # fzf
  if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
  fi
}

setup_conda() {
  echo 'conda'

  # Linux/WSL2
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

  # Homebrew
  # >>> conda initialize >>>
  # !! Contents within this block are managed by 'conda init' !!
  __conda_setup="$('/opt/homebrew/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
  if [ $? -eq 0 ]; then
      eval "$__conda_setup"
  else
      if [ -f "/opt/homebrew/anaconda3/etc/profile.d/conda.sh" ]; then
          . "/opt/homebrew/anaconda3/etc/profile.d/conda.sh"
      else
          export PATH="/opt/homebrew/anaconda3/bin:$PATH"
      fi
  fi
  unset __conda_setup
  # <<< conda initialize <<<

  ### conda shortcuts

  alias cact="conda activate"
  alias cdact="conda deactivate"
}

setup_brew() {
  echo 'brew'

  # Homebrew/LinuxBrew
  [[ -s "/opt/homebrew/bin/brew" ]] && eval "$(/opt/homebrew/bin/brew shellenv)"
  [[ -s "/home/linuxbrew/.linuxbrew/bin/brew" ]] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  if [[ -s "/opt/homebrew/anaconda3" ]]; then
    # export PATH="/opt/homebrew/anaconda3/bin:$PATH"
  fi
}

setup_rvm() {
  echo 'rvm'
  # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
  export PATH="$PATH:$HOME/.rvm/bin"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
}

setup_rust() {
  echo 'rust'
  [[ -s "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"
}

setup_nvm() {
  echo "nvm"
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
}

setup_gcloud() {
  echo "gcloud"
  # The next line updates PATH for the Google Cloud SDK.
  if [ -f '/Users/richardwu/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/richardwu/google-cloud-sdk/path.zsh.inc'; fi
  # The next line enables shell command completion for gcloud.
  if [ -f '/Users/richardwu/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/richardwu/google-cloud-sdk/completion.zsh.inc'; fi
}

### Function invocations

# setup_fzf
setup_conda
setup_brew
# setup_rvm
setup_rust
setup_nvm
# setup_gcloud

echo "done"

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/richardwu/.lmstudio/bin"
source "/Users/richardwu/.rover/env"

