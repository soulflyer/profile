#!/usr/bin/env bash
# Needs defbro:
# brew install jwbargsten/misc/defbro
# and pbex:
# https://apple.stackexchange.com/a/334633/323876

# This line works fine as long as there are no spaces in the browser name
# With spaces pbex will be called with only the first part of the name as param.
# $(/Users/iain/bin/pbex $(defbro --json | jq -r '.[] | select(.isDefault).name' ))

command="$(defbro --json | jq -r '.[] | select(.isDefault).name')"
"$(/Users/iain/bin/pbex $command)" $@
