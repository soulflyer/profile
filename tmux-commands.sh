#!/usr/bin/env bash

pt(){
    if [ $1 ]
    then
        tmux set pane-border-status top
        tmux set pane-border-format "#{pane_index}:#{pane_title}"
        printf '\033]2;%s\033\\' $1
    else
        echo "pt turns on tmux pane titles and sets the title for the current pane. Give it a parameter to use as a title. pto turns it off again. "
    fi
}

pto(){
    tmux set pane-border-status off
}

alias ta="tm ~/Code/Clojure/Luminus/photo-api"
alias tb="tm ~/Code/backup"
alias te="tm ~/Code/emacs-iain"
alias th="tm ~/Code/Clojure/Descjop/hinh-anh"
alias ti="tm ~/Code/Clojure/image-lib"
alias tp="tm ~/Code/profile"
alias tc="tm ~/Code/Clojure/scratch"
alias tj="tm ~/Code/Javascript/scratchjs"
alias tt="tm ~/Code/tm"
alias tzu="tmux new-window -d -n "Zulip" ~/bin/zulip"
alias tf="tm ~/Code/Flexiana/open-source/frankie"
alias tx="tm ~/Code/Flexiana/open-source/framework"
alias ts="tm ~/Code/Flexiana/kepler16/fabric-edge/scanner-service"
alias tk="tm ~/Code/Flexiana/kepler16"
