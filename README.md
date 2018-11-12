# Richard's dotfiles

## 1. Cloning
Clone this dotfile into your local repo
```sh
git clone https://github.com/richardwu/dotfiles.git $HOME/dotfiles
```

## 2. Symlinking config files

Remember to symlink these configuration files to `$HOME/`:
```sh
ln -s $HOME/dotfiles/.profile $HOME/.profile
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
ln -s $HOME/dotfiles/isdone.osascript $HOME/.isdone.osascript     # MacOS only
```

## 3. Git configuration

Configure aliases and global `.gitignore_global`:
```sh
./config-git.sh "Your Name" "Your email"
```

## 4. tmux

Install `tmux`
```sh
brew install tmux                   # Homebrew (MacOS) or Linxubrew (Linux)
```

Uncomment the appropriate section of `.tmux.conf` for your OS:
```
# MacOS Settings
...

# Windows Settings
...

# Linux Settings
...
```

## 5. Zsh

Install `zsh`
```sh
brew install zsh zsh-completions    # Homebrew (MacOS) or Linxubrew (Linux)
```

## 6. Vim setup

To install all the Vim plugins, run the script
```sh
./install-vim-plugins.sh
```
Then open up Vim and run the command
```
:PluginInstall
```
