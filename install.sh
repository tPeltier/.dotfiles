#!/bin/bash

# lvim

mkdir -p "$HOME/.config/lvim" 
mkdir -p "$HOME/.config/lvim/plugin"
ln -sf "$HOME/.dotfiles/lvim/config.lua" "$HOME/.config/lvim"

rm -rf "$HOME/.config/X11"
ln -s "$HOME/.dotfiles/X11" "$HOME/.config"

# i3

rm -rf "$HOME/.config/i3"
ln -s "$HOME/.dofiles/i3" "$HOME/.config"

# zsh

mkdir -p "$HOME/.config/zsh"
ln -sf "$HOME/.dotfiles/zsh/.zshenv" "$HOME"
ln -sf "$HOME/.dotfiles/zsh/.zshrc" "$HOME/.config/zsh"
ln -sf "$HOME/.dotfiles/zsh/aliases" "$HOME/.config/zsh/aliases"
rm -rf "$HOME/.config/zsh/external"
ln -sf "$HOME/.dotfiles/zsh/external" "$HOME/.config/zsh"

