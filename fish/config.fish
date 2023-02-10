if status is-interactive
    # Commands to run in interactive sessions can go here
end

# My Aliases
# ===============================================================================================================================
#
# xdg-open
alias ii='xdg-open'

# ls aliases
alias ls='exa --oneline --sort=type --sort=extension'
alias ll='exa --long --all --sort=type --sort=extension'
alias lsa='exa --long --header --icons --git'
# alias ll='ls -alF'
alias la='exa --all'
# alias la='ls -A'
alias l='exa --git-ignore'
# alias l='ls -CF'
alias llt='exa --long --tree --level=3'
alias lt='exa --tree --level=3'

# cd aliases
# alias cd=

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
alias gc="cz c"
# alias gca="git commit -v -a"
alias gcam="gca --amend"
alias gch="git cherry-pick"
alias gco="git checkout"
alias d="git diff -M"
alias gdc="git diff -M --cached"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gl='git log --graph --pretty="format:%C(yellow)%h%C(auto)%d%Creset %s %C(white) %C(cyan)%an, %C(magenta)%ar%Creset"'
alias gla='git log --color'
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

# update
alias upall='sudo dnf update --refresh -y && flatpak update -y'

# run script i made to grep my keymap file
alias whatdoing='~/whatdoing.sh'

# tmux aliases
alias tmuxl='tmux list-sessions'
alias tmuxks='tmux kill-server'

# ===============================================================================================================================
# vi mode
fish_vi_key_bindings

set -g fish_key_bindings fish_vi_key_bindings
bind -M command \a 'clear; commandline -f repaint' 
bind -M insert \a 'clear; commandline -f repaint'

# zoxide 
zoxide init fish | source

# starship cli
starship init fish | source
