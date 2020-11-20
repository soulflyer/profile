#!/usr/bin/env bash
# echo $PATH
# echo "Hello from .bashrc"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

hostspecific=.`hostname | tr '[:upper:]' '[:lower:]' | sed s/\.local// | sed s/\.site//`_rc
if [ -f ~/"$hostspecific" ]
then
    . ~/"$hostspecific"
fi

source ~/Code/profile/tmux-commands.sh
source ~/Code/profile/h.sh


alias ec="emacsclient -a '' -tty"
alias EC="SUDO_EDITOR=\"emacsclient -nw\" sudo -e"

alias ll="ls -la"
alias la="ls -a"
alias jps="jps -l"


alias sf="ssh jphuquoc@soulflyer.co.uk"
alias mi="ssh mimi"
alias red="ssh reddell"

alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"

# alias oi="offlineimap"
# alias oid="offlineimap -d maildir"
# alias oii="offlineimap -f ~/Mail/INBOX"

alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push origin"
alias gd="git diff"
alias gl="git log --oneline --graph --decorate"

alias tree="tree -C"
alias t2="tree -C -L 2"
alias t3="tree -C -L 3"
alias t4="tree -C -L 4"
t(){
    TROPTS=""
    if [ $1 ]
    then
        TROPTS=" -C -L $*"
    fi
    tree $TROPTS
}

man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}

pushdir() {
    if [ $1 ]
    then
        pushd $1 > /dev/null
    else
        cd
    fi
}

alias pu=pushdir
alias po=popd

alias tb="tm ~/Code/backup"
alias tp="tm ~/Code/profile"
alias te="tm ~/Code/emacs-iain"
alias th="tm ~/Code/Clojure/Descjop/hinh-anh"
alias ta="tm ~/Code/Clojure/Luminus/photo-api"
alias ti="tm ~/Code/Clojure/image-lib"
alias tt="tm ~/Code/tm"
alias td="tm ~/Code/Flexiana/Data-42"

EDITOR="emacsclient -nw"
export EDITOR

# Completion stuff
# ================
# https://stackoverflow.com/a/58308956/1671119
export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# This one makes __git_complete work for aliases like gp. Has to be manually loaded or it wont exist until after git commit is called.
[ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && . /usr/local/etc/bash_completion.d/git-completion.bash

__git_complete gp _git_checkout
#  Lifted fron http://mediadoneright.com/content/ultimate-git-ps1-bash-prompt
Color_Off="\[\033[0m\]"
Red="\[\033[0;31m\]"
Green="\[\033[0;32m\]"
Yellow="\[\033[0;33m\]"
Purple="\[\033[0;35m\]"
Blue="\[\033[0;34m\]"

PathShort="\w"
PathFull="\W"

# TODO Wrap this in an if checking for existence of __git_ps1 function
export PS1=$Purple'$PS1START'$Color_Off'$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    $(echo `git status` | grep "Your branch is ahead" > /dev/null 2>&1); \
    if [ $? -eq "0" ]; then \
      # @4 - Clean repository - nothing to commit
      echo "'$Yellow'"$(__git_ps1 "(%s) "); \
    else \
      # - Clean repository and pushed to origin
      echo "'$Green'"$(__git_ps1 "(%s) "); \
    fi; \
  else \
    # @5 - Changes to working tree
    echo "'$Red'"$(__git_ps1 "(%s) "); \
  fi) '$Green$PathFull$Color_Off': "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "'$Blue$PathFull$Color_Off': "; \
fi)'

# History stuff
# =============
# Not sure this is necessary:
# export PROMPT_COMMAND='echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m").log'

shopt -s histappend
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# this would be useful, but odd things seem to happen occasionaly (repeated commands)
# export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

# This disables the suspend command so that ctrl-s will search command history
stty -ixon

HISTTIMEFORMAT="%F %H:%m "

tz() {
    # Can take a single parameter representing the hour, or none for current time
    hournow=`date "+%H"`
    # get rid of the leading 0 so it isn't interpreted as octal
    hournow=${hournow#0}
    [[ $1 != "" ]] && time=$1 || time=$hournow
    local offset=$(($time - $hournow))
    [[ $offset < 0 ]] && offset=$(( offset + 24 ))
    echo "GMT     " $( TZ=GMT                 date -v "+"$offset"H" "+%H:%M")
    echo "UK      " $( TZ=Europe/London       date -v "+"$offset"H" "+%H:%M")
    echo "CET     " $( TZ=Europe/Prague       date -v "+"$offset"H" "+%H:%M")
    echo "Vietnam " $( TZ=Asia/Saigon         date -v "+"$offset"H" "+%H:%M")
}


listening() {
    if [ $# -eq 0 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P
    elif [ $# -eq 1 ]; then
        sudo lsof -iTCP -sTCP:LISTEN -n -P | grep -i --color $1
    else
        echo "Usage: listening [pattern]"
    fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob=!.git/*'
