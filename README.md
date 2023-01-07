# Richard's dotfiles

## Latest tested versions

macOS: Monterey 12.0.1


## 1. Cloning
Clone this dotfile into your local repo
```sh
git clone git@github.com:richardwu/dotfiles.git $HOME/dotfiles
```

## 2. Symlinking config files

Symlink configuration files to `$HOME/` (**warning**: this will `rm` existing
configuration files in `$HOME/`):
```sh
./config-symlinks.sh
```

NB: you may need to delete existing `~/.zshrc` and re-symlink it since installing
oh-my-zsh will create a ~/.zshrc.


## 3. Vim

Most distros don't have `+clipboard` feature enabled (`vim --version`) eg WSL. Install `vim-gtk`:
```sh
sudo apt-get update
sudo apt-get install -y vim-gtk
```

## 3.5 HomeBrew/LinuxBrew

See brew.sh.

## 4. Git configuration

Configure aliases and global `.gitignore_global`:
```sh
./config-git.sh "<Your Name>" "<Your email>"
```

## 5. tmux

Install `tmux`
```sh
brew install tmux                   # Homebrew (MacOS) or Linxubrew (Linux)
```

Uncomment the appropriate sections of `.tmux.conf` for your `tmux -V` version and OS (look for `TODO`s).

## 5. Zsh

Install `zsh`, `fzf`, and wget
```sh
brew install zsh zsh-completions fzf wget    # Homebrew (MacOS) or Linxubrew (Linux)
sudo apt-get install zsh fzf    	     # WSL/Ubuntu
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

## 7. Local copy-pasting

In general:

1. Make sure terminal has copy to clipboard enabled
2. Our `tmux-yank.sh` should handle tmux copy-pasta
3. Make sure to follow Vim setup above for `+clipboard` feature
4. Name sure `set clipboard=X` is correct for the given system (see `~/.vimrc`)


## 8. Remote copy-pasting

See https://hackernoon.com/tmux-in-practice-copy-text-from-remote-session-using-ssh-remote-tunnel-and-systemd-service-dd3c51bca1fa for more info.

### MacOS or Linux

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


### Windows

Enable X11 Forwarding in PuTTY/terminal emulator and start up an X11 server on your local machine (e.g. VcXsrv).
