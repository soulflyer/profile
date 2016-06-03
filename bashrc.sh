echo "hello from .bashrc"
export PATH=/usr/bin:/bin:/usr/sbin:/sbin
hostspecific=.`hostname | sed s/\.local// | sed s/\.site//`.profile
if [ -f ~/"$hostspecific" ]
then
. ~/"$hostspecific"
else
echo $hostspecific not found
fi
export PATH=~/bin:/usr/local/bin:$PATH

# Disable xon xoff so it doesn't interfere with C-s for forward search command history
#stty -ixon

alias ec="emacsclient -nw"
alias EC="SUDO_EDITOR=\"emacsclient -nw\" sudo -e"

alias tree="tree -C"
alias sf="ssh jphuquoc@soulflyer.co.uk"
alias mi="ssh mimi.local"

shopt -s histappend

alias t2="tree -C -L 2"
alias t3="tree -C -L 3"
alias t4="tree -C -L 4"

alias oi="offlineimap"
alias oid="offlineimap -d maildir"
alias oii="offlineimap -f ~/Mail/INBOX"

alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push origin"
alias gd="git diff"

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

alias cd=pushdir
alias pd=popd
alias tb="tm ~/Code/backup"
alias tp="tm ~/Code/profile"
alias te="tm ~/Code/emacs-live"

EDITOR="emacsclient -nw"
export EDITOR

# if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
#     . /opt/local/etc/profile.d/bash_completion.sh
# fi


# if [ -f /opt/local/share/git-core/git-prompt.sh ]; then
#     . /opt/local/share/git-core/git-prompt.sh
# fi

# if [ -f /usr/lib/git-core/git-sh-prompt ]; then
#     . /usr/lib/git-core/git-sh-prompt
# fi

# source ~/.git-prompt.sh

#  Lifted fron http://mediadoneright.com/content/ultimate-git-ps1-bash-prompt
#  Ugly code, but it works. Setting PS1 might be better in a function like this:
#  https://gist.github.com/47267
#
#  Customize BASH PS1 prompt to show current GIT repository and branch.
#  by Mike Stewart - http://MediaDoneRight.com

#  SETUP CONSTANTS
#  Bunch-o-predefined colors.  Makes reading code easier than escape sequences.
#  I don't remember where I found this.  o_O

# Reset
Color_Off="\[\033[0m\]"       # Text Reset

# Regular Colors
Black="\[\033[0;30m\]"        # Black
Red="\[\033[0;31m\]"          # Red
Green="\[\033[0;32m\]"        # Green
Yellow="\[\033[0;33m\]"       # Yellow
Blue="\[\033[0;34m\]"         # Blue
Purple="\[\033[0;35m\]"       # Purple
Cyan="\[\033[0;36m\]"         # Cyan
White="\[\033[0;37m\]"        # White

# High Intensty
IBlack="\[\033[0;90m\]"       # Black
IRed="\[\033[0;91m\]"         # Red
IGreen="\[\033[0;92m\]"       # Green
IYellow="\[\033[0;93m\]"      # Yellow
IBlue="\[\033[0;94m\]"        # Blue
IPurple="\[\033[0;95m\]"      # Purple
ICyan="\[\033[0;96m\]"        # Cyan
IWhite="\[\033[0;97m\]"       # White

# Various variables you might want for your PS1 prompt instead
Time12h="\T"
Time12a="\@"
PathShort="\w"
PathFull="\W"
NewLine="\n"
Jobs="\j"


# This PS1 snippet was adopted from code for MAC/BSD http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96

export PS1='$PS1START$(git branch &>/dev/null;\
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

export PROMPT_COMMAND='echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m").log'
