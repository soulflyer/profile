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
