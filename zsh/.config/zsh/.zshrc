# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

autoload -Uz compinit && compinit

source $ZDOTDIR/themes/powerlevel10k/powerlevel10k.zsh-theme

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
        source $plugin_file
    fi
done


# Completers
_comp_options+=(globdots)
zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path "$ZDOTDIR/.zcompcache"

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no

# Set up fzf key bindings and fuzzy completion
if type "fzf" &> /dev/null ; then
    zstyle ':fzf-tab:comlete:cd:*' fzf-preview 'ls --color $realpath'
    source <(fzf --zsh)
fi

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh
