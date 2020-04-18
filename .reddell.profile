source /usr/lib/git-core/git-sh-prompt
export PS1START="Reddell:"
alias ls="ls --color"

ga() {
    echo "Setting gamma to remove blue cast"
    xgamma -bgamma 0.8
    xgamma -rgamma 0.95
    xgamma -ggamma 0.9
}
