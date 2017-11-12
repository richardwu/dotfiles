which brew > /dev/null

# Get silver searcher and fzf
if [ $? -eq 0 ]; then
  brew ls the_silver_searcher &> /dev/null
  if [ $? -ne 0 ]; then
    brew install the_silver_searcher
  fi
  brew ls fzf &> /dev/null
  if [ $? -ne 0 ]; then
    brew install fzf
  fi
else
  echo "[WARNING]: could not install brew packages (requires brew)"
  exit 1
fi

which git > /dev/null
# Get Vundle
if [ $? -eq 0 ]; then
  if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  fi
else
  echo "[WARNING]: could not install Vundle (requires git)"
  exit 1
fi

# CockroachDB things
if [ ! -f ~/.vim/syntax/crlogictest.vim ]; then
  mkdir -p ~/.vim/syntax
  curl https://raw.githubusercontent.com/cockroachdb/scripts/master/scripts/crlogictest.vim > ~/.vim/syntax/crlogictest.vim
fi
