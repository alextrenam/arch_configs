#!/bin/bash

# Battery threshold
THRESHOLD=20
BATTERY_LEVEL=$(cat /sys/class/power_supply/BAT0/capacity)
STATUS=$(cat /sys/class/power_supply/BAT0/status)

if [ "$BATTERY_LEVEL" -le "$THRESHOLD" ] && [ "$STATUS" == "Discharging" ]; then
    notify-send -u critical "⚠️ Battery Low" "Battery is at ${BATTERY_LEVEL}%!"

    paplay /usr/share/sounds/freedesktop/stereo/dialog-warning.oga
    sleep 1
fi
