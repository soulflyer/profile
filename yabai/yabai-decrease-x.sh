#!/bin/bash
WINDOW_X=$(yabai -m query --windows --window | jq '.frame.x')
wx=${WINDOW_X#-}
if [ $wx == 0 ]
then yabai -m window --resize right:-20:0
else yabai -m window --resize left:-20:0
fi
