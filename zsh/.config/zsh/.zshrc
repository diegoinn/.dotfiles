setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

autoload -Uz compinit && compinit

source $ZDOTDIR/aliases.sh

# KeyBinds
bindkey -e
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

# Plugins
export ZPLUGINS=$ZDOTDIR/plugins
plugins=(
    fzf-tab
    zsh-syntax-highlighting
    zsh-completions
)

for plugin in $plugins; do
    plugin_file=$ZPLUGINS/$plugin/$plugin.plugin.zsh
    if [ -f $plugin_file ]; then
        echo "installing: $plugin"
        source $plugin_file
    fi
done

# Set up fzf key bindings and fuzzy completion
if type "fzf" &> /dev/null ; then
    source <(fzf --zsh)
fi

