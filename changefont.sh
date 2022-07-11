#!/bin/bash
NEW_FONT=$1
SIZE=$2
FONT="${NEW_FONT:=Monaco} ${SIZE:=14}"
echo $FONT
/usr/libexec/PlistBuddy -c "Set :'New Bookmarks':0:'Normal Font' $FONT" \
                        ~/Library/Preferences/com.googlecode.iterm2.plist

defaults read -app iTerm > /dev/null

killall iTerm2
