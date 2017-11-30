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
ln -s ~/dotfiles/.gitignore_global ~/.gitignore_global
```

## Git configuration

Configure aliases and global `.gitignore_global`:
```sh
./config-git.sh "Your Name" "Your email"
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
./install-vim-plugins.sh
```
Then open up Vim and run the command
```
:PluginInstall
```
