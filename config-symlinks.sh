rm -f $HOME/.profile
rm -f $HOME/.zshrc
rm -f $HOME/.fzf.zsh
rm -f $HOME/.tmux.conf
rm -f $HOME/.tmux/tmux-yank.sh
rm -f $HOME/.vimrc
rm -f $HOME/.gitignore_global
rm -f $HOME/.isdone.osascript

ln -s $HOME/dotfiles/.profile $HOME/.profile
ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -s $HOME/dotfiles/.fzf.zsh $HOME/.fzf.zsh
ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
mkdir -p $HOME/.tmux
ln -s $HOME/dotfiles/tmux-yank.sh $HOME/.tmux/tmux-yank.sh
ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc
ln -s $HOME/dotfiles/.gitignore_global $HOME/.gitignore_global
ln -s $HOME/dotfiles/isdone.osascript $HOME/.isdone.osascript     # MacOS only
