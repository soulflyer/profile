#!/usr/bin/env bash

$(/Users/iain/bin/pbex $(defbro --json |\
  jq -r '.[] | select(.isDefault).name' )) --app=http://tracker.flexiana.com
