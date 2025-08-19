#!/bin/bash

bu() {
    url=$(buku -p -f4 | fzf -m --reverse --preview "buku -p {1}" --preview-window=wrap | cut -f2)

    if [ -n "$url" ]; then
        echo "$url" | xargs firefox
    fi
}

# A script to copy screenshots from the ./ss/ folder to a text file for easier implementation of homework
gather_pics() {
    # TODO can make fancier
    # - check for ss file
    # - get user input to echo into file
    # - subdirs in ss
    # - multi runs for multi subdirs
    # honestly maybe just python then lol

    mkdir resources

    zip -r ./resources/ss_archive ./ss

    eza --sort=created ss/ >> ./resources/pictures.txt
}

makehw() {
    "$DOTFILES/scripts/make_hw.sh"
}

md2pdf() {
    # render a md to pdf
    # arg: md file

    file=$1
    name=$(echo $file | cut -d '.' -f 1)

    echo "rendering $file as $name.pdf"
    pandoc $file -so $name.pdf
}

vman() {
    nvim -c "SuperMan $*"

    if [ "$?" != "0" ]; then
        echo "No manual entry for $*"
    fi
}

fj() {
    if [[ -n $TMUX ]]; then
        return
    fi

    # get tmuxp ids
    ID="$(ls "$HOME/.config/tmuxp" | sed -e 's/\.yml$//')"
    if [[ -z "$ID" ]]; then
        tmux new-session
    fi

    create_new_session="Create New Session"

    ID="${create_new_session}"$'\n'"$ID"
    ID="$(echo "$ID" | fzf | cut -d: -f1)"

    if [[ "$ID" = "${create_new_session}" ]]; then
        tmux new-session
    elif [[ -n "$ID" ]]; then
        tmuxp load "$ID"
    fi
}
