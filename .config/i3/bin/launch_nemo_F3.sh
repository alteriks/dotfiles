#!/bin/bash
# nemo & sleep 0.1; xdotool windowactivate --sync $(xdotool getactivewindow) key F3

# XDOTOOL_ACTIVE=$(xdotool getactivewindow)
# nemo & sleep 0.2; xdotool windowactivate --sync $XDOTOOL_ACTIVE key --clearmodifiers alt+v; xdotool windowactivate --sync $XDOTOOL_ACTIVE key --clearmodifiers x

nemo & sleep 0.2; xdotool windowactivate --sync $(xdotool getactivewindow) key --clearmodifiers alt+v; xdotool windowactivate --sync $(xdotool getactivewindow) key --clearmodifiers x
