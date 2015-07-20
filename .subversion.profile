#!/bin/bash
source ~/.git-prompt.sh
alias gc="open /Applications/Google\ Chrome.app"
alias aw="add-watermark"
alias ecp="export-customer-photos"
alias ce="EDITOR=vi crontab -e"

function um(){
  diskutil unmount "/Volumes/$1";
}

export PATH=/Applications/Emacs.app/Contents/MacOS/bin:/Applications/Emacs.app/Contents/MacOS:/opt/local/bin:/opt/local/sbin:/Applications/adt/sdk/tools:/Applications/adt/sdk/platform-tools:~/Code/moai-dev/bin/osx:/opt/X11/bin:$PATH
alias ls="ls -G"
