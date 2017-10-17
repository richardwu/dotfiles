# Richard's dotfiles

## Cloning

Clone this dotfile into your local repo
```sh
git clone https://github.com/richardwu/dotfiles.git ~/dotfiles
```

## Symlinking config files

Remember to symlink these configuration files to `~/`:
```sh
ln -s ~/dotfiles/.profile ~/.profile
ln -s ~/dotfiles/.zshrc ~/.zshrc
ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/.vimrc ~/.vimrc
ln -s ~/dotfiles/.vim/ ~/.vim
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
```

## Git

Configure `gitignore_global`:
```sh
git config --global core.excludesfile ~/.gitignore
```

## tmux

Install `tmux`
```sh
brew install tmux
```

## Zsh

Install `zsh`
```sh
brew install zsh zsh-completions
```

## Vim setup

To install all the Vim plugins, run the script
```sh
chmod 755 install-vim-plugins.sh
./install-vim-plugins.sh
```
Then open up Vim and run the command
```
:PluginInstall
```
