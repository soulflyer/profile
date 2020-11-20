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

alias tb="tm ~/Code/backup"
alias tp="tm ~/Code/profile"
alias te="tm ~/Code/emacs-iain"
alias th="tm ~/Code/Clojure/Descjop/hinh-anh"
alias ta="tm ~/Code/Clojure/Luminus/photo-api"
alias ti="tm ~/Code/Clojure/image-lib"
alias tt="tm ~/Code/tm"
alias td="tm ~/Code/Flexiana/Data-42"
