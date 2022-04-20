# Setup fzf
# ---------
if [[ ! "$PATH" == */home/richardwu/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/richardwu/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/richardwu/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/richardwu/.fzf/shell/key-bindings.zsh"
