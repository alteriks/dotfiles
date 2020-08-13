#!/bin/bash
#autorandr_mode=$( autorandr | rofi -dmenu | sed -e 's/ .*//')
autorandr_mode=$( autorandr --detected | rofi -dmenu -width -50 -lines 5 -p "Display mode" | sed -e 's/ .*//')
if [[ -n ${autorandr_mode} ]]; then
  autorandr -c ${autorandr_mode}
fi
