#!/bin/zsh
if [[ -z $STOW_FOLDERS ]]; then
    STOW_FOLDERS="zsh,nvim,tmux,ghostty"
fi

if [[ -z $DOTFILES ]]; then
    DOTFILES=$HOME/.dotfiles
fi

pushd $DOTFILES
for folder in $(echo $STOW_FOLDERS | sed "s/,/ /g")
do
        echo "stow $folder"
        stow -D $folder
        stow $folder
done
popd
