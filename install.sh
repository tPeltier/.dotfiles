#!/bin/bash

set -e

###############################################################################
# Config
###############################################################################

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"

###############################################################################
# Helpers
###############################################################################

info()    { printf "\033[0;34m  > %s\033[0m\n" "$*"; }
success() { printf "\033[0;32m  ✓ %s\033[0m\n" "$*"; }
warn()    { printf "\033[0;33m  ! %s\033[0m\n" "$*"; }

# link_file <source> <target>
#
# Creates a symlink at <target> pointing to <source>.
# - If target is already a correct symlink: skips.
# - If target is a real file or dir: removes it, then links.
# - If target is a broken or wrong symlink: removes it, then links.
link_file() {
    local src="$1"
    local dst="$2"

    # Already correct — nothing to do
    if [ -L "$dst" ] && [ "$(readlink "$dst")" = "$src" ]; then
        info "already linked: $dst"
        return
    fi

    # Exists but wrong (real file, real dir, or stale/wrong symlink)
    if [ -e "$dst" ] || [ -L "$dst" ]; then
        warn "removing existing: $dst"
        rm -rf "$dst"
    fi

    mkdir -p "$(dirname "$dst")"
    ln -s "$src" "$dst"
    success "linked: $dst -> $src"
}

###############################################################################
# Packages
###############################################################################

# nvim
# lazy-bootstrap.lua handles plugin manager installation on first run — no
# extra step needed here.
info "Setting up nvim..."
link_file "$DOTFILES/nvim" "$XDG_CONFIG_HOME/nvim"

# tmux
# Plugins (tpm, extrakto, tmux-copycat) are committed to the repo, so no
# clone step needed.
info "Setting up tmux..."
link_file "$DOTFILES/tmux" "$XDG_CONFIG_HOME/tmux"

# sway
info "Setting up sway..."
link_file "$DOTFILES/sway" "$XDG_CONFIG_HOME/sway"

# i3status
info "Setting up i3status..."
link_file "$DOTFILES/i3status" "$XDG_CONFIG_HOME/i3status"

# kitty
info "Setting up kitty..."
link_file "$DOTFILES/kitty" "$XDG_CONFIG_HOME/kitty"

# btop
info "Setting up btop..."
link_file "$DOTFILES/btop" "$XDG_CONFIG_HOME/btop"

# btop
info "Setting up yazi..."
link_file "$DOTFILES/yazi" "$XDG_CONFIG_HOME/yazi"

# fastfetch
info "Setting up fastfetch..."
link_file "$DOTFILES/fastfetch" "$XDG_CONFIG_HOME/fastfetch"

# zathura
info "Setting up zathura..."
link_file "$DOTFILES/zathura" "$XDG_CONFIG_HOME/zathura"

# .bashrc lives at $HOME, not $XDG_CONFIG_HOME
info "Setting up .bashrc..."
link_file "$DOTFILES/.bashrc" "$HOME/.bashrc"

###############################################################################
# Done
###############################################################################

printf "\n\033[0;32mDone. Re-source your shell or open a new terminal.\033[0m\n"
