#!/usr/bin/env BASH

nohup /Applications/Thunderbird.app/Contents/MacOS/thunderbird 2>&1 &
nohup /Applications/Slack.app/Contents/MacOS/Slack >/dev/null 2>&1 &
# TODO Linear doesn't behave nicely if it is already running. Wrap this in a check for already running process
nohup /Applications/Linear.app/Contents/MacOS/Linear >/dev/null 2>&1 &
nohup /Applications/Zulip.app/Contents/MacOS/Zulip > /dev/null 2>&1 &
