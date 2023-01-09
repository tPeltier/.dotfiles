#!/bin/bash

########
# nvim #
########

mkdir -p "$HOME/.config/nvim"
# mkdir -p "$HOME/.config/nvim/undo"

rm -rf "$HOME/.config/nvim"
ln -sf "$HOME/.dotfiles/nvim/" "$HOME/.config"

########
# fish #
########

mkdir -p "$HOME/.config/fish"
rm -rf "$HOME/.config/fish"
ln -sf "$HOME/.dotfiles/fish/" "$HOME/.config"


#########
# Fonts #
#########

#mkdir -p "$XDG_DATA_HOME"
#cp -rf "$HOME/.dotfiles/fonts" "$XDG_DATA_HOME"

########
# tmux #
########

mkdir -p "$HOME/.config/tmux"
ln -sf "$HOME/.dotfiles/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

[ ! -d "$HOME/.config/tmux/plugins" ] \
&& git clone https://github.com/tmux-plugins/tpm \
"$HOME/.config/tmux/plugins/tpm"
