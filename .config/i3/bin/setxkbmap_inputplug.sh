#!/bin/bash
# XInput events monitor daemon - https://github.com/andrewshadura/inputplug
# install inputplug with yay

NAME="$(basename $0)"
if [[  $(pgrep --count --full "$NAME") -gt 1 ]]; then
  echo "Already running: $NAME"
else
  { echo "XIDeviceEnabled XISlaveKeyboard"; inputplug -d -c /bin/echo; } |
    while read event
    do
      case $event in
        XIDeviceEnabled*XISlaveKeyboard*)
          ~/.config/i3/bin/setxkbmap.sh
          ;;
      esac
    done &
fi
