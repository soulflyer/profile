#!/bin/bash
WINDOW_Y=$(yabai -m query --windows --window | jq '.frame.y')
if [ $WINDOW_Y -ge 30 ]
then yabai -m window --resize top:0:20
else yabai -m window --resize bottom:0:20
fi
