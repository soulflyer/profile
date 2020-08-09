#!/usr/bin/env bash
# bash --version
# echo "hello from .subversion.profile"
source ~/bin/git-prompt.sh
if [ -f /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash ]; then
    . /Applications/Xcode.app/Contents/Developer/usr/share/git-core/git-completion.bash
fi

__git_complete gp _git_checkout

export BASH_COMPLETION_COMPAT_DIR="/usr/local/etc/bash_completion.d"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

source ~/Code/profile/kubernetes.sh
source ~/Code/profile/secrets.sh
source ~/Code/profile/java.sh

eval "$(zoxide init bash)"

alias aw="add-watermark"
alias ecp="export-customer-photos"
alias ce="EDITOR=vi crontab -e"

export MOUSE_MAC_ADDR="b8-f6-b1-22-b1-02"
export KEYBOARD_MAC_ADDR="7c-c3-a1-89-e0-ac"
alias cm="bluetoothconnector --connect $MOUSE_MAC_ADDR    --notify"
alias ck="bluetoothconnector --connect $KEYBOARD_MAC_ADDR --notify"
cb(){
    echo "connecting bluetooth devices"
    cm&
    ck&
}

function um(){
  diskutil unmount "/Volumes/$1";
}

export PATH=/Applications/Wine\ Stable.app/Contents/Resources/wine/bin:/usr/local/nmh/bin:/usr/local/mysql/bin:/Applications/Emacs.app/Contents/MacOS/bin:/Applications/Emacs.app/Contents/MacOS:/opt/local/bin:/opt/local/sbin:~/Library/Android/sdk/tools:~/Library/Android/sdk/platform-tools:~/Code/moai-dev/bin/osx:/opt/X11/bin:/Applications/Hugin/HuginTools:/Users/iain/anaconda/bin:/Library/TeX/texbin:$PATH
alias ls="ls -G"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

eval "$(thefuck --alias)"
