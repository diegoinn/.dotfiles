#!/bin/zsh

sudo dnf copr enable scottames/ghostty
sudo dnf install -y nvim ghostty flatpack stow

flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

flatpak install io.github.zen_browser.zen
