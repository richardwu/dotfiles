# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
ZSH_THEME="robbyrussell"
source $ZSH/oh-my-zsh.sh
# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Treat **/ recursively
set -s globstar

# Github open origin remote in Chrome
ghurl(){
  echo https://$(git remote show origin | grep 'Fetch URL' | grep -o 'github\.com.*' | sed 's/:/\//')
}

github(){
  url=$(ghurl)
  echo "opening $url..."
  open $url
}


source ~/.profile
