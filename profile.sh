hostspecific=.`hostname | sed s/\.local// | sed s/\.site//`.profile
if [ -f ~/$hostspecific ]
then
. ~/$hostspecific
else
echo $hostspecific not found
fi

# Disable xon xoff so it doesn't interfere with C-s for forward search command history
stty -ixon

alias ec="emacsclient -nw"
alias EC="SUDO_EDITOR=\"emacsclient -nw\" sudo -e"

alias tree="tree -C"
alias sf="ssh jphuquoc@soulflyer.co.uk"
alias mi="ssh mimi.local"

shopt -s histappend

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

EDITOR="emacsclient -nw"
export EDITOR

if [ -f /opt/local/etc/profile.d/bash_completion.sh ]; then
    . /opt/local/etc/profile.d/bash_completion.sh
fi


if [ -f /opt/local/share/git-core/git-prompt.sh ]; then
    . /opt/local/share/git-core/git-prompt.sh
fi

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


# This PS1 snippet was adopted from code for MAC/BSD I saw from: http://allancraig.net/index.php?option=com_content&view=article&id=108:ps1-export-command-for-git&catid=45:general&Itemid=96
# I tweaked it to work on UBUNTU 11.04 & 11.10 plus made it mo' better

export PS1='$PS1START$(git branch &>/dev/null;\
if [ $? -eq 0 ]; then \
  echo "$(echo `git status` | grep "nothing to commit" > /dev/null 2>&1; \
  if [ "$?" -eq "0" ]; then \
    $(echo `git status` | grep "Your branch is up-to-date" > /dev/null 2>&1); \
    if [ $? -eq "0" ]; then \
      # - Clean repository and pushed to origin
      echo "'$Green'"$(__git_ps1 "(%s) "); \
    else \
      # @4 - Clean repository - nothing to commit
      echo "'$IYellow'"$(__git_ps1 "('$Green'%s'$IYellow') "); \
    fi; \
  else \
    # @5 - Changes to working tree
    echo "'$Red'"$(__git_ps1 "(%s) "); \
  fi) '$Green$PathFull$Color_Off': "; \
else \
  # @2 - Prompt when not in GIT repo
  echo "'$Blue$PathFull$Color_Off': "; \
fi)'

pushd .
