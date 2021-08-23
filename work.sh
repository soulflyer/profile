#!/usr/bin/env BASH

# Open some apps needed for work
nohup /Applications/Thunderbird.app/Contents/MacOS/thunderbird 2>&1 &
nohup /Applications/Slack.app/Contents/MacOS/Slack >/dev/null 2>&1 &
# TODO Linear doesn't behave nicely if it is already running. Wrap this in a check for already running process
nohup /Applications/Linear.app/Contents/MacOS/Linear >/dev/null 2>&1 &
nohup /Applications/Zulip.app/Contents/MacOS/Zulip > /dev/null 2>&1 &

# Open web pages for time tracking and calendar
open https://calendar.google.com/calendar/u/0/r/week
open https://tracker.flexiana.com/Timer
