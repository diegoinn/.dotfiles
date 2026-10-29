#!/bin/zsh

sudo dnf copr enable scottames/ghostty
sudo dnf copr enable dejan/lazygit
sudo dnf install -y nvim ghostty flatpack stow lazygit fzf

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
flatpak install io.github.zen_browser.zen
