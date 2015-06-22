source ~/.git-prompt.sh
alias gc="open /Applications/Google\ Chrome.app"
alias aw="add-watermark"
alias ecp="export-customer-photos"


function um(){
  diskutil unmount /Volumes/$1;
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export PATH=/Applications/Emacs.app/Contents/MacOS/bin:/Applications/Emacs.app/Contents/MacOS:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/Applications/adt/sdk/tools:/Applications/adt/sdk/platform-tools:~/Code/moai-dev/bin/osx:$PATH
alias ls="ls -G"
