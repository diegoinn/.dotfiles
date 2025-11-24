setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
unsetopt HIST_SAVE_NO_DUPS       # Write a duplicate event to the history file

source $ZDOTDIR/aliases.sh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)
