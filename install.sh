#!/bin/bash

# lvim

mkdir -p "$HOME/.config/lvim" 
ln -sf "$HOME/.dotfiles/lvim/config.lua" "$HOME/.config/lvim"

rm -rf "$HOME/.config/X11"
ln -s "$HOME/.dotfiles/X11" "$HOME/.config"
