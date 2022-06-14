#!/usr/bin/env bash
# Needs defbro:
# brew install jwbargsten/misc/defbro
# and pbex:
# https://apple.stackexchange.com/a/334633/323876

# $(/Users/iain/bin/pbex $(defbro --json | jq -r '.[] | select(.isDefault).name' ))
command="$(defbro --json | jq -r '.[] | select(.isDefault).name')"
# # echo $command
"$(/Users/iain/bin/pbex $command)" $@
