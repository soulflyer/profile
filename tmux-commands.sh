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

# alias trss="tm ~/Code/Flexiana/reify/study-sheet"
# alias tres="tm ~/Code/Flexiana/reify/esource-service"
# alias trb="tm ~/Code/Flexiana/reify/bengal"
# alias trh="tm ~/Code/Flexiana/reify/hooke"
# alias trs="tm ~/Code/Flexiana/reify/salk"
# alias trr="tm ~/Code/Flexiana/reify/retool-admin"
# alias trp="tm ~/Code/Flexiana/reify/pantry"
