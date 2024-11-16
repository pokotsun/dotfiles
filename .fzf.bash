# Setup fzf
# ---------
if [[ ! "$PATH" == */home/pokotsun/.cache/dein/repos/github.com/junegunn/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/pokotsun/.cache/dein/repos/github.com/junegunn/fzf/bin"
fi
# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/pokotsun/.cache/dein/repos/github.com/junegunn/fzf/shell/completion.bash" 2> /dev/null
# Key bindings
# ------------
source "/home/pokotsun/.cache/dein/repos/github.com/junegunn/fzf/shell/key-bindings.bash"
