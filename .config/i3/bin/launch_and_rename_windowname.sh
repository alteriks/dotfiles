#!/bin/bash
NAME=$(echo $* | egrep -o "scratchpad-\w+")
exec $* &
CMD_PID=$!
sleep 1
xdotool set_window --name $NAME $(xdotool search --pid $CMD_PID)
