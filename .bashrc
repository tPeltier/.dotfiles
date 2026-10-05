# ~/.bashrc: executed by bash(1) for non-login shells.
# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# launch sway on tty1 before loading anything else (no fork, unlike $(tty))
[[ /proc/self/fd/0 -ef /dev/tty1 ]] && exec sway

######################################################

export DOTFILES="$HOME/.dotfiles"
export EDITOR=nvim
export SUDO_EDITOR=nvim

set -o vi
bind -m vi-command 'Control-g: clear-screen'
bind -m vi-insert 'Control-g: clear-screen'

######################################################

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

######################################################

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# add to PATH only if missing, so nested shells don't keep growing it
path_prepend() { [[ -d $1 && ":$PATH:" != *":$1:"* ]] && PATH="$1:$PATH"; }
path_append()  { [[ -d $1 && ":$PATH:" != *":$1:"* ]] && PATH="$PATH:$1"; }

path_prepend "$HOME/.local/bin"
path_append /usr/local/go/bin
path_append "$HOME/go/bin"
path_append "$HOME/.cargo/bin"
export GOPATH=$HOME/go
export PATH

######################################################

# cache `<tool> init` output; regenerated when the binary is newer than the cache
cached_init() {
  local bin cache="${XDG_CACHE_HOME:-$HOME/.cache}/bash-init/$1.bash"
  bin=$(command -v "$1") || return
  if [[ ! -s $cache || $bin -nt $cache ]]; then
    mkdir -p "${cache%/*}"
    "${@:2}" > "$cache"
  fi
  . "$cache"
}

cached_init zoxide zoxide init bash
cached_init starship starship init bash --print-full-init

fe() {
  local file
  file=$(fzf --preview 'bat --color=always --line-range :100 {}' 2>/dev/null) && nvim "$file"
}

######################################################

#   Autocompletion for kubectl
#source <(kubectl completion bash)

######################################################

# lazy-load bash-completion on the first <Tab>; 124 tells readline to retry
# with the completion specs that just got loaded
if ! shopt -oq posix && [ -f /usr/share/bash-completion/bash_completion ]; then
  _lazy_bash_completion() {
    complete -r -D
    unset -f _lazy_bash_completion
    . /usr/share/bash-completion/bash_completion
    return 124
  }
  complete -D -F _lazy_bash_completion
fi

######################################################

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar
