#!/bin/bash
NAME=$(echo $* | egrep -o "scratchpad-\w+")
if [[  $(pgrep --count --full $NAME) -gt 1 ]]; then
  #above condition matches this script so we need to use count >= 1
  echo "$NAME is running, nothing to do."
else
  exec $* &
  CMD_PID=$!
  usleep 200
  xdotool set_window --name $NAME $(xdotool search --pid $CMD_PID | head -1)
  i3-msg "[instance=$NAME] move to scratchpad"
fi
