#!/usr/bin/env bash
# echo $PATH
# echo "Hello from .bashrc"

# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

#TODO change this so it takes a wildcard and removes ANY guff after the name.
hostspecific=.`hostname | tr '[:upper:]' '[:lower:]' | sed s/\.local// | sed s/\.broadband// | sed s/\.site// | sed s/\.lan//`_rc
# echo "Hostspecific is: $hostspecific"

if [ -f ~/"$hostspecific" ]
then
    # echo "Running host specific setup file $hostspecific"
    . ~/"$hostspecific"
fi

source ~/Code/profile/tmux-commands.sh
source ~/Code/profile/bin/h.sh
[ -f "/Users/iain/.ghcup/env" ] && source "/Users/iain/.ghcup/env" # ghcup-env

alias books="ec ~/Documents/books/bookshelf"

alias emd="emacs --daemon 2>&1 | lolcat -s 1.5 -S 35"
alias ec="emacsclient -tty"
alias EC="SUDO_EDITOR=\"emacsclient -nw\" sudo -e"
alias ecb="emacsclient -e '(ibuffer)' -tty"
alias ecd="ec ."
alias ecc="emacsclient -e '(calendar)' -tty"
alias ecn="emacsclient -e '(deft)' -tty"
alias eco="emacsclient -e '(org-agenda-list)' -tty"

alias eg="emacsclient -c &"
alias EG="SUDO_EDITOR=\"emacsclient -c\" sudo -e &"
alias egb="emacsclient -e '(ibuffer)' -c &"
alias egd="emacsclient -c ."
alias egc="emacsclient -e '(calendar)' -c &"
alias egn="emacsclient -e '(deft)' -c &"
alias ego="emacsclient -e '(org-agenda-list)' -c &"

alias ls="ls -G"
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

alias md="mdls -name kMDItemFinderComment"

alias colours="echo -e '\033[30m██\033[31m██\033[32m██\033[33m██\033[34m██\033[35m██\033[36m██\033[37m██\n\033[90m██\033[91m██\033[92m██\033[93m██\033[94m██\033[95m██\033[96m██\033[97m██'"

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

# This is a simple hack to add colour to man page display. An alternative would be to install "most"
# http://www.jedsoft.org/most/
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

EDITOR="emacsclient -nw"
export EDITOR

# Completion stuff (moved to machine specific profile files)
# ==========================================================
# https://stackoverflow.com/a/58308956/1671119
# export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
# [[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

# # This one makes __git_complete work for aliases like gp. Has to be manually loaded or it wont exist until after git commit is called.
# [ -f /usr/local/etc/bash_completion.d/git-completion.bash ] && . /usr/local/etc/bash_completion.d/git-completion.bash
# __git_complete gp _git_checkout

# Set the prompt
# ==============
#  Lifted fron http://mediadoneright.com/content/ultimate-git-ps1-bash-prompt
Color_Off="\[\033[0m\]"
Red="\[\033[0;31m\]"
Green="\[\033[0;32m\]"
Yellow="\[\033[0;33m\]"
Purple="\[\033[0;35m\]"
Blue="\[\033[0;94m\]"
# Note that Blue ^ is redefined to be bright blue as its unreadable on black
# Change the 9 to a 3 to put it back

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

# direnv
# ======
# Looks for a .env file in each directory and applies any environment variables it finds there
eval "$(direnv hook bash)"

# History stuff
# =============
# Not sure this is necessary:
# export PROMPT_COMMAND='echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m").log'

shopt -s histappend
export HISTSIZE=1000000
export HISTFILESIZE=1000000

# this is be useful, but odd things seem to happen occasionaly (repeated commands)
# try -c -r instead of f -n
# export PROMPT_COMMAND="history -a; history -c; history -r;${PROMPT_COMMAND}"

# just add new commands to history, don't clear and re-read. That way the local
# history stays local so each window will appear to have its own until history -r
# is run or a new shell is started.
export PROMPT_COMMAND="history -a;${PROMPT_COMMAND}"
alias hr="history -r"

# This disables the suspend command so that ctrl-s will search command history
stty -ixon

HISTTIMEFORMAT="%F %T"

tz() {
    ~/bin/timezones.sh $@ | h [0-9:]
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

# Setup fzf for fuzzy searching.
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
# If rg is available use that:
command -v rg >/dev/null 2>&1 || export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob=!.git/*'

export _ZO_ECHO='1'
eval "$(zoxide init --cmd c bash)"


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

