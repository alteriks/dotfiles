#!/bin/bash
NAME=$(echo $* | egrep -o "scratchpad-\w+")
exec $* &
CMD_PID=$!
usleep 200
xdotool set_window --name $NAME $(xdotool search --pid $CMD_PID | head -1)
i3-msg "[instance=$NAME] move to scratchpad"
