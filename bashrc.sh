# If not running interactively, don't do anything
case $- in
    *i*) ;;
    *) return;;
esac

hostspecific=.`hostname | tr '[:upper:]' '[:lower:]' | sed s/\.local// | sed s/\.site//`.profile
if [ -f ~/"$hostspecific" ]
then
    . ~/"$hostspecific"
fi
export PATH=~/bin:/usr/local/bin:$PATH:/usr/bin:/bin:/usr/sbin:/sbin

source ~/Code/profile/tmux-commands.sh

source ~/Code/profile/data42-config.sh
export D42ONE_CONFDIR=$HOME/Code/Flexiana/Data-42/d42one-release-conf/d42one-conf.d
export D42ONE_LIBDIR=$HOME/Code/Flexiana/Data-42/d42one-release-conf/d42lib
source $D42ONE_CONFDIR/d42one.rc
source ~/Code/profile/h.sh

# Disable xon xoff so it doesn't interfere with C-s for forward search command history
#stty -ixon

# Remap § to ` for English keyboard
# hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000035,"HIDKeyboardModifierMappingDst":0x700000064}]}'

alias ec="emacsclient -nw"
alias EC="SUDO_EDITOR=\"emacsclient -nw\" sudo -e"

alias ll="ls -la"
alias la="ls -a"
alias jps="jps -l"

alias tree="tree -C"
alias sf="ssh jphuquoc@soulflyer.co.uk"
alias mi="ssh mimi"
alias red="ssh reddell"
alias dev-hana="ssh ec2-user@dev-hana"
alias acceptance="ssh ubuntu@acceptance"

alias rot13="tr 'A-Za-z' 'N-ZA-Mn-za-m'"

alias t2="tree -C -L 2"
alias t3="tree -C -L 3"
alias t4="tree -C -L 4"

# alias oi="offlineimap"
# alias oid="offlineimap -d maildir"
# alias oii="offlineimap -f ~/Mail/INBOX"

alias gs="git status"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push origin"
alias gd="git diff"
alias gl="git log --pretty=oneline --abbrev-commit"

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
alias te="tm ~/Code/emacs.d"
alias th="tm ~/Code/Clojure/Descjop/hinh-anh"
alias ta="tm ~/Code/Clojure/Luminus/photo-api"
alias ti="tm ~/Code/Clojure/image-lib"
alias tt="tm ~/Code/tm"
alias td="tm ~/Code/Flexiana/Data-42"

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

export PROMPT_COMMAND='echo "$(date "+%Y-%m-%d.%H:%M:%S") $(pwd) $(history 1)" >> ~/.logs/bash-history-$(date "+%Y-%m").log'

export HH_CONFIG=hicolor
shopt -s histappend
export HISTFILESIZE=10000
export HISTSIZE=${HISTFILESIZE}
# export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"

# This disables the suspend command so that ctrl-s will search command history
stty -ixon

HISTTIMEFORMAT="%a %H:%m "

export PATH=/Users/iain/.local/bin:$PATH

tz() {
    # Can take a single parameter representing the hour, or none for current time
    hournow=`date "+%H"`
    # get rid of the leading 0 so it isn't interpreted as octal
    hournow=${hournow#0}
    [[ $1 != "" ]] && time=$1 || time=$hournow
    local offset=$(($time - $hournow))
    [[ $offset < 0 ]] && offset=$(( offset + 24 ))
    echo "Josh    " $( TZ=America/Los_Angeles date -v "+"$offset"H" "+%H")
    echo "Eduardo " $( TZ=America/New_York    date -v "+"$offset"H" "+%H")
    echo "GMT     " $( TZ=GMT                 date -v "+"$offset"H" "+%H")
    echo "UK      " $( TZ=Europe/London       date -v "+"$offset"H" "+%H")
    echo "CET     " $( TZ=Europe/Prague       date -v "+"$offset"H" "+%H")
    echo "Sergey  " $( TZ=Europe/Moscow       date -v "+"$offset"H" "+%H")
    echo "Vietnam " $( TZ=Asia/Saigon         date -v "+"$offset"H" "+%H")
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
