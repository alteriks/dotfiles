#!/bin/bash
# tmux helper.  http://unix.stackexchange.com/a/325816/119298
if [[ $(tmux show-window-option synchronize-panes) == *on ]]
then    tmux set-window-option -q synchronize-panes off
        restore="tmux set-window-option -q synchronize-panes on"
fi
active_window=$(tmux display-message -p '#I')
tmux list-panes -s -t $active_window|
# eg 0.1: [80x11] [history 0/2000, 0 bytes] %2
while IFS=".:$IFS" read winid pane rest
do    tmux send-keys -t $winid.$pane $pane
done
$restore
