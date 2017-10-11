# Usage

Clone this dotfile into your local repo
```
git clone https://github.com/richardwu/dotfiles.git ~/dotfiles
```

Remember to symlink these configuration files to `~/`:
```
ln -s ~/dotfiles/.profile ~/.profile
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim/ ~/.vim
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
```

Install `tmux`
```
brew install tmux
```

Install `zsh`
```
brew install zsh zsh-completions
```

Vim specific steps:
- Clone Vundle `git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
- Install the_silver_searcher `brew install the_silver_searcher`
- Run `:PluginInstall` in Vim (for Vundle plugins)

