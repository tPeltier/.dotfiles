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

# some more ls aliases (ls -> exa)
alias ls='eza --oneline --sort=type --sort=extension'
alias lsa='eza --long --header --icons --git'
alias ll='eza --long --all --sort=type --sort=extension'
alias la='eza --all'
alias l='eza --tree --level=2'
alias lt='eza --tree --level=3'
alias llt='eza --long --tree --level=3'
alias ltt='eza --tree --level=4'
# alias ll='ls -alF'
# alias la='ls -A'
# alias l='eza --git-ignore'
# alias l='ls -CF'

# FZF aliases
#alias cfzf='code $(fzf)'
alias nfzf='nvim -c "lua require(\"telescope.builtin\").find_files()"'

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
alias ds="git diff --stat"
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

alias lg="lazygit"

# docker aliases
alias dcup="docker compose up"
alias dcupd="docker compose up -d"
alias dcupb="docker compose up --build"
alias dcdn="docker compose down"
alias dcps="docker ps"
# alias dcsh="sudo docker exec sh"
alias dockerstart="sudo systemctl start docker"
alias dockerstop="sudo systemctl stop docker"

# tmux aliases
alias t='tmux'
#alias tmuxls='tmux list-sessions'
alias tl='tmux list-sessions'
#alias tmuxks='tmux kill-server'
alias tks='tmux kill-server'
alias td='tmux detach'
alias ta='tmux attach'

# update
alias upall='sudo dnf upgrade -y && sudo flatpak upgrade -y'
alias upnvim='nvim -c "Lazy update" && nvim -c "MasonUpdate"'

# buku
alias b='buku --suggest'
#alias fpb= 'firefox --private-window $(buku -p -f 40 | fzf | cut -f1)'
alias fpbu='firefox --private-window $(buku -p -f 10 | fzf)'

# ollama
alias ollamastart='docker start ollama'
alias ollamastop='docker stop ollama'
alias ai='docker exec -it ollama ollama run gemma2:27b'
alias lite='docker exec -it ollama ollama run llama3.1'
alias tiny='docker exec -it ollama ollama run phi4'

# firefox nightly ( testing; known bad solution )
alias devbrowser='$HOME/.local/opt/firefox-devel/firefox/firefox'

# TOP 10 
# alias top10='history | awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a;}' | grep -v "./" | column -c3 -s " " -t | sort -nr | nl |  head -n10'

# terminal public pastebin
# alias tb="nc termbin.com 9999"

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


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

alias venvinit='python -m venv .venv'
alias venvsource='source .venv/bin/activate'
alias venvfreeze='pip freeze > requirements.txt'
alias venvinstall='pip install -r requirements.txt'

# pacman / arch
alias update='sudo pacman -Syu'
alias rmpkg="sudo pacman -Rsn"
alias cleanch="sudo pacman -Scc"
alias fixpacman="sudo rm /var/lib/pacman/db.lck"
alias gitpkg='pacman -Q | grep -i "\-git" | wc -l'          # List amount of -git packages
alias big="expac -H M '%m\t%n' | sort -h | nl"              # Sort installed packages according to size in MB

# Cleanup orphaned packages
alias cleanup='sudo pacman -Rns (pacman -Qtdq)'

# Get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# Recent installed packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"

# Get fastest mirrors
alias mirror="sudo cachyos-rate-mirrors"

# docker powershell launch
alias pwsh="docker run -it mcr.microsoft.com/dotnet/sdk:9.0 pwsh"

