#!/bin/bash
set -e

scrot /tmp/screen.png
convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
[[ -f ~/.config/i3/bin/lock-icon.png ]] && convert /tmp/screen.png ~/.config/i3/bin/lock-icon.png -gravity center -composite -matte /tmp/screen.png
i3lock -i /tmp/screen.png
