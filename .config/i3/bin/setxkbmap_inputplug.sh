#!/bin/sh
# XInput events monitor daemon - https://github.com/andrewshadura/inputplug
# install inputplug with yay

{ echo "XIDeviceEnabled XISlaveKeyboard"; inputplug -d -c /bin/echo; } |
while read event
do
        case $event in
        XIDeviceEnabled*XISlaveKeyboard*)
                ~/.config/i3/bin/setxkbmap.sh
                ;;
        esac
done &
