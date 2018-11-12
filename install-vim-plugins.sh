# Get fzf
which brew > /dev/null
if [ $? -eq 0 ]; then
  brew ls fzf &> /dev/null
  if [ $? -ne 0 ]; then
    brew install fzf
  fi
else
  which git > /dev/null
  if [ $? -eq 0 ]; then
    if [ ! -d "$HOME/.fzf" ]; then
      git clone --depth 1 https://github.com/junegunn/fzf.git "$HOME/.fzf"
      "$HOME/.fzf/install"
    fi
  else
    echo "[WARNING]: could not install fzf (requires brew OR git)"
    exit 1
  fi
fi

which git > /dev/null
# Get Vundle
if [ $? -eq 0 ]; then
  if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
  fi
else
  echo "[WARNING]: could not install Vundle (requires git)"
  exit 1
fi

# CockroachDB things
if [ ! -f "$HOME/.vim/syntax/crlogictest.vim" ]; then
  mkdir -p "$HOME/.vim/syntax"
  curl https://raw.githubusercontent.com/cockroachdb/scripts/master/scripts/crlogictest.vim > "$HOME/.vim/syntax/crlogictest.vim"
fi
