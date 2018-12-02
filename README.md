# Richard's dotfiles

## 1. Cloning
Clone this dotfile into your local repo
```sh
git clone https://github.com/richardwu/dotfiles.git $HOME/dotfiles
```

## 2. Symlinking config files

Symlink configuration files to `$HOME/` (**warning**: this will `rm` existing
configuration files in `$HOME/`):
```sh
./config-symlinks.sh
```

## 3. Git configuration

Configure aliases and global `.gitignore_global`:
```sh
./config-git.sh "<Your Name>" "<Your email>"
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
then install `oh-my-zsh`
```
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
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

## 7. Remote copy-pasting


To copy-paste through an SSH remote tunnel, one can start a launchd pbcopy service (MacOS)
or a systemd xclip service (Linux). Simply run the following on your **local server** (service
by default binds to localhost:19988)
```sh
./config-remote.sh
```
whenever you SSH you will need to port forward from your remote server to your local service
with the `-R` flag, for example
```
ssh -R 19988:localhost:19988 richardwu@192.168.11.111
```
or simply add the following to your `~/.ssh/config` file
```
Host myhost
  Hostname 192.168.11.111
  User richardwu
  ...
  RemoteForward 19988 localhost:19988       # Add this line
  ...
```
**Warning**: only do this with a trusted remote server!

