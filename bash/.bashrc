# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Set Editor to Neovim
EDITOR=nvim
# Set VI Mode 
set -o vi
bind -m vi-command 'Control-g: clear-screen'
bind -m vi-insert 'Control-g: clear-screen'

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

####ALIASES
#
# enable color support of ls and also add handy aliases
#if [ -x /usr/bin/dircolors ]; then
    #test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    #alias ls='ls --color=auto'
    ##alias dir='dir --color=auto'
    ##alias vdir='vdir --color=auto'
#
    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
#fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# confirm actions
alias rm='rm -i'
alias rmy='rm'
alias mv='mv -i'
alias mvy='mv'
alias cp='cp -i'
alias cpy='cp'
# open
alias ii='xdg-open'

# some more ls aliases (ls -> exa)
alias ls='eza --oneline --sort=type --sort=extension'
alias ll='eza --long --all --sort=type --sort=extension'
alias lsa='eza --long --header --icons --git'
# alias ll='ls -alF'
alias la='eza --all'
# alias la='ls -A'
alias l='eza --git-ignore'
# alias l='ls -CF'
alias llt='eza --long --tree --level=3'
alias lt='eza --tree --level=3'
# FZF aliases
alias cfzf='code $(fzf)'
alias nfzf='nvim $(fzf)'

# git aliases
alias s="git status -sb"
alias ga="git add"
alias gau="git add -u"
alias gap="git add -p"
alias gb="git branch"
alias gba="git branch --all"
alias gc="git commit "
alias gcz="cz c"
alias gca="git commit -v -a"
alias gcam="gca --amend"
alias gch="git cherry-pick"
alias gco="git checkout"
alias d="git diff -M"
alias gdc="git diff -M --cached"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gl='git log --graph --pretty="format:%C(yellow)%h%C(auto)%d%Creset %s %C(white) %C(cyan)%an, %C(magenta)%ar%Creset"'
alias gla='git log --all'
alias gm="git merge --no-ff"
alias gmf="git merge --ff-only"
alias gp="git push"
alias gpt="git push --tags"
alias gr="git reset"
alias grp="git reset --patch"
alias grh="git reset --hard"
alias grsh="git reset --soft HEAD~"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias grbi="git rebase -i"
alias grv="git remote -v"
alias gst="git stash"
alias gstp="git stash pop"
alias gw="git show"

# docker aliases
alias dcup="sudo docker-compose up"
alias dcdn="sudo docker-compose down"
alias dcps="sudo docker ps"
alias dcsh="sudo docker exec sh"
alias dockerstart="sudo systemctl start docker"
alias dockerstop="sudo systemctl stop docker"

# tmux aliases
alias tmuxl='tmux list-sessions'
alias tmuxks='tmux kill-server'

# update
alias upall='sudo dnf upgrade && sudo flatpak upgrade'

# buku
alias b='buku --suggest'
#alias fpb= 'firefox --private-window $(buku -p -f 40 | fzf | cut -f1)'
alias fpbu='firefox --private-window $(buku -p -f 10 | fzf)'
alias bgui='~/b.sh'

# findme.sh 
alias findme='~/findme.sh'

# make a new dir and name it, init git repo, cp .gitignore
# source: https://linxize.com/post/how-to-create-bash-aliases/u
# for python
mkpy () 
{
	mkdir -p -- "$1" && cd -P -- "$1" && cp /home/mywsl/gitignore/Python.gitignore ./ && git init
}

# TOP 10 
# alias top10='history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

eval "$(zoxide init bash)"
eval "$(starship init bash)"

# set PATH to include private ~/.local/bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
