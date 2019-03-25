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

# returns the full checked out branch name
# e.g. origin/master
function ghbranch() {
  declare branch=$(git branch -vv | grep \* | grep -o '\[.*\]' | cut -d ':' -f 1)
  branch=${branch#\[}
  branch=${branch%\]}
  echo $branch
}

function ghremote() {
  if [ $# -ne 1 ]; then
    echo "ghremote() requires <remote-alias>"
    return 1
  fi

  echo $(git remote -v | grep "$1.*push" | grep -o ':.*/' | cut -d ':' -f 2 | cut -d '/' -f 1)
}

function github(){
  declare url=$(ghurl)
  declare branch=$(ghbranch)

  declare final=${url%.git}
  if [ $branch != "origin/master" ]; then
    declare remotealias=$(echo $branch | cut -d '/' -f 1)
    declare remote=$(ghremote $remotealias)
    if [ $? -eq 1 ]; then
      return 2
    fi
    declare updatedbranch=$(echo $branch | sed "s/$remotealias/$remote/" | sed 's/\//:/')
    final="$final/compare/master...$updatedbranch?expand=1"
  fi
  echo "opening $final..."
  open $final
}

function saydone() {
  ~/.isdone.osascript
}

function manopt() {
    local cmd=$1 opt=$2
      [[ $opt == -* ]] || { (( ${#opt} == 1 )) && opt="-$opt" || opt="--$opt"; }
        man "$cmd" | col -b | awk -v opt="$opt" -v RS= '$0 ~ "(^|,)[[:blank:]]+" opt "([[:punct:][:space:]]|$)"'
}

source ~/.profile
