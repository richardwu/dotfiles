#!/bin/bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  # Linux
  cmd="sudo apt-get"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  cmd=brew
  if [ ! -x "$(command -v brew)" ]; then
    # Install brew using git.
    if [ -x "$(command -v git)" ]; then
      if [ ! -d "$HOME/.fzf" ]; then
        git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
        "$HOME/.fzf/install"
      fi
    else
      echo "[WARNING]: could not install fzf (requires brew OR git)"
    fi
  fi
else
  echo "unsupported OS $OSTYPE"
  exit 1
fi

# Get fzf
if [ ! -x "$(command -v fzf)" ]; then
  $cmd install fzf
fi

# Get ag
if [ ! -x "$(command -v ag)" ]; then
  if [[ $cmd == "brew" ]]; then
    pkg=the_silver_searcher
  else
    pkg=silversearcher-ag
  fi
  $cmd install $pkg
fi

# Get Vundle
if [ -x "$(command -v git)" ]; then
  if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    mkdir -p "$HOME/.vim/bundle"
    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
  fi
else
  echo "[WARNING]: could not install Vundle (requires git)"
fi

# if [ -x "$(command -v pip)" ]; then
#   pip install flake8
# else
#   echo "[WARNING]: require pip to install pip stuff"
# fi
