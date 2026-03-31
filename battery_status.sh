#! /usr/bin/env bash

# battery-check.sh
# Run once; cron will call it every 5 min

battery_info=$(acpi -b)
percent=$(echo "$battery_info" | grep -oP '[0-9]+(?=%)')
status=$(echo "$battery_info" | grep -oP 'Charging|Discharging|Full')

if [[ "$status" == "Charging" && $percent -ge 97 ]]; then
    notify-send -e -u normal -a "Battery" -h "string:sound-name:battery-caution" -i battery-full-charged-symbolic  "Battery at ${percent}%. You can unplug the charger."

elif [[ "$status" == "Charging" && $percent -ge 65 ]]; then
    notify-send -e -u normal -a "Battery" -h "string:sound-name:battery-caution" -i battery-level-60-charging-symbolic "Battery at ${percent}%. Consider stopping charging."

elif [[ "$status" == "Discharging" && $percent -le 45 ]]; then
    notify-send -e -u normal -a "Battery" -h "string:sound-name:battery-caution" -i battery-level-20-symbolic "Battery at ${percent}%. Please plug in the charger soon."

elif [[ "$status" == "Discharging" && $percent -le 20 ]]; then
    notify-send -e -u critical -a "Battery" -h "string:sound-name:battery-caution" -i battery-010-symbolic "Battery at ${percent}%. Plug in immediately!"
fi
