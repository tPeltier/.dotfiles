# funcs ############################################################################################

fe() {
  local file
  file=$(fzf --preview 'bat --color=always --line-range :100 {}' 2>/dev/null) && nvim "$file"
}

# strip execute (-x) from only regular files under the given dir(s), default .
stripexec() {
    find "${@:-.}" -type f -exec chmod a-x {} +
}

# aliases ##########################################################################################

# Common use
alias ......='cd ../../../../..'
alias .....='cd ../../../..'
alias ....='cd ../../..'
alias ...='cd ../..'
alias ..='cd ..'
alias dir='dir --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias grubup="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias hw='hwinfo --short'                                   # Hardware Info
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias psmem='ps auxf | sort -nr -k 4'
alias tarnow='tar -caf '
alias tarpeek='tar -tvf '
alias untar='tar -zxvf '
alias vdir='vdir --color=auto'
alias wget='wget -c '

# vanity
alias ff='fastfetch'

# confirm actions
alias rm='rm -i'
alias rmy='rm'
alias mv='mv -i'
alias mvy='mv'
alias cp='cp -i'
alias cpy='cp'

# open
alias ii='xdg-open'
alias y='yazi'

# edit privileged files w sudoedit
alias svim='sudo -e'

# journalctl err msgs
alias jctl="journalctl -p 3 -xb"

# ls aliases (ls -> exa)
alias ls='eza --oneline --sort=type --sort=extension'
alias lsa='eza --long --header --icons --git'
alias ll='eza --long --all --sort=type --sort=extension'
alias la='eza --all'
alias l='eza --tree --level=2'
alias lt='eza --tree --level=3'
alias llt='eza --long --tree --level=3'
alias ltt='eza --tree --level=4'

# git aliases
alias d="git diff -M"
alias ds="git diff --stat"
alias ga="git add"
alias gap="git add -p"
alias gau="git add -u"
alias gb="git branch"
alias gba="git branch --all"
alias gc="git commit "
alias gca="git commit -v -a"
alias gcam="gca --amend"
alias gch="git cherry-pick"
alias gco="git checkout"
alias gcz="cz c"
alias gdc="git diff -M --cached"
alias gf="git fetch"
alias gfa="git fetch --all"
alias gl='git log --graph --pretty="format:%C(yellow)%h%C(auto)%d%Creset %s %C(white) %C(cyan)%an, %C(magenta)%ar%Creset"'
alias gla='git log --all'
alias glo='git log --oneline'
alias gm="git merge --no-ff"
alias gmf="git merge --ff-only"
alias gp="git push"
alias gpt="git push --tags"
alias gr="git reset"
alias grb="git rebase"
alias grbc="git rebase --continue"
alias grbi="git rebase -i"
alias grh="git reset --hard"
alias grp="git reset --patch"
alias grsh="git reset --soft HEAD~"
alias grv="git remote -v"
alias gst="git stash"
alias gstp="git stash pop"
alias gw="git show"
alias lg="lazygit"
alias s="git status -sb"

# docker aliases
alias dcdn="docker compose down"
alias dcps="docker ps"
alias dcsh="docker exec sh"
alias dcup="docker compose up"
alias dcupb="docker compose up --build"
alias dcupd="docker compose up -d"
alias dockerstart="sudo systemctl start docker"
alias dockerstop="sudo systemctl stop docker"

# tmux aliases
alias t='tmux'
alias ta='tmux attach'
alias td='tmux detach'
alias tks='tmux kill-server'
alias tl='tmux list-sessions'

# buku
#alias fpb= 'firefox --private-window $(buku -p -f 40 | fzf | cut -f1)'
alias b='buku --suggest'
alias fpbu='firefox --private-window $(buku -p -f 10 | fzf)'

# ollama
alias ai='docker exec -it ollama ollama run'
alias ollamastart='docker start ollama'
alias ollamastop='docker stop ollama'

# py venv
alias venvfreeze='pip freeze > requirements.txt'
alias venvinit='python -m venv .venv'
alias venvinstall='pip install -r requirements.txt'
alias venvsource='source .venv/bin/activate'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# TOP 10 
# alias top10='history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10'

# terminal public pastebin
# alias tb="nc termbin.com 9999"

# system aliases ###################################################################################

# lazy + mason / nvim
alias up-nvim='nvim -c "Lazy update" && nvim -c "MasonUpdate"'

# dns + flatpak / fedora
alias up-dnf-fp='sudo dnf upgrade -y && sudo flatpak upgrade -y'

# pacman / arch
alias big="expac -H M '%m\t%n' | sort -h | nl"                                   # Sort installed packages according to size in MB
alias cleanch="sudo pacman -Scc"
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'                                  # Cleanup orphaned packages
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'                               # List amount of -git packages
alias mirror="sudo cachyos-rate-mirrors"                                         # Get fastest mirrors (cachyos)
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"    # Recent installed packages
alias rmpkg="sudo pacman -Rsn"
alias update='sudo pacman -Syu'

# basic shell ######################################################################################

# # "standard" cli env "vanity"
# # enable color support of ls and also add handy aliases
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     alias ls='ls --color=auto'
#     alias dir='dir --color=auto'
#     alias vdir='vdir --color=auto'
#     alias grep='grep --color=auto'
#     alias fgrep='fgrep --color=auto'
#     alias egrep='egrep --color=auto'
# fi
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='eza --git-ignore'
# alias l='ls -CF'
# # colored GCC warnings and errors
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# archive #########################################################################################

# ocker powershell launch
# alias pwsh="docker run -it mcr.microsoft.com/dotnet/sdk:9.0 pwsh"
