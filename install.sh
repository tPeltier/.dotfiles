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
