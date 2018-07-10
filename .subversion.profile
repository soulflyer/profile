#!/bin/bash
# echo "hello from .subversion.profile"
source ~/.git-prompt.sh
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

alias aw="add-watermark"
alias ecp="export-customer-photos"
alias ce="EDITOR=vi crontab -e"

function um(){
  diskutil unmount "/Volumes/$1";
}

export PATH=/Applications/Wine\ Stable.app/Contents/Resources/wine/bin:/usr/local/nmh/bin:/usr/local/mysql/bin:/Applications/Emacs.app/Contents/MacOS/bin:/Applications/Emacs.app/Contents/MacOS:/opt/local/bin:/opt/local/sbin:~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:~/Code/moai-dev/bin/osx:/opt/X11/bin:/Applications/Hugin/HuginTools:/Users/iain/anaconda/bin:$PATH
alias ls="ls -G"
