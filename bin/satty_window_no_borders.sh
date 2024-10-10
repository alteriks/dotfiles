#!/bin/sh

# Select window without borders
grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | "\(.rect.x+.window_rect.x),\(.rect.y+.window_rect.y) \(.window_rect.width)x\(.window_rect.height)"' | slurp)" - | satty --output-filename ~/tmp/satty-$(date '+%Y%m%d-%H:%M:%S').png --filename -
