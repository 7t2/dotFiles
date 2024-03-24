#!/bin/bash

# Example notifier script -- lowers screen brightness, then waits to be killed
# and restores previous brightness on exit.

## CONFIGURATION ##############################################################

# Brightness will be lowered to this value.
min_brightness=25

###############################################################################

# Gets current brightness via ddcutil
get_brightness() {
    ddcutil getvcp 10 | awk '{gsub(/,$/,"",$9); print $9}'
}

# Sets brightness value
set_brightness() {
    ddcutil setvcp 10 $1
}

trap 'exit 0' TERM INT
trap "set_brightness $(get_brightness); kill %%" EXIT
set_brightness $min_brightness
sleep 2147483647 &
wait
