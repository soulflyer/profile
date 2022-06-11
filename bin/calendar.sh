#!/usr/bin/env bash

# /Applications/Vivaldi.app/Contents/MacOS/Vivaldi --app=https://calendar.google.com
$(/Users/iain/bin/pbex $(defbro --json | jq -r '.[] | select(.isDefault).name' )) --app=https://calendar.google.com
