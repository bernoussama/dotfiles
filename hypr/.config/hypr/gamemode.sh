#!/usr/bin/env sh
HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')
# check if power-mode is set to power-saver
POWERMODE=$(powerprofilesctl get | grep power-saver)
if [ "$POWERMODE" = "power-saver" ]; then
  powerprofilesctl set balanced
else
  powerprofilesctl set power-saver
fi
if [ "$HYPRGAMEMODE" = 1 ]; then
  hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:shadow:enabled 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 1;\
        keyword decoration:rounding 0;\
        keyword decoration:inactive_opacity 0.9;\
        keyword misc:vfr = true;\
        keyword decoration:active_opacity 1;"
  exit
fi
hyprctl reload
