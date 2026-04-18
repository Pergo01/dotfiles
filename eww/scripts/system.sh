#!/bin/bash
if [ "$1" == "brightness" ]; then
    read -r vcp feature_code c brightness max_brightness < <(ddcutil getvcp 10 --brief)
    echo "${brightness}"


elif [ "$1" == "volume" ]; then
    if command -v wpctl &>/dev/null; then
        if wpctl get-volume @DEFAULT_SINK@ | grep MUTED &>/dev/null; then
            echo 0
        else
            volume=$(wpctl get-volume @DEFAULT_SINK@ | awk '{print $2*100}')
            echo "${volume}"
        fi
    fi

# elif [ "$1" == "mic" ]; then
#     mic_level=$(pactl list sources | grep 'Volume:' | awk -F/ '{print $2}' | awk '{print $1}' | head -n 3 | tail -n 1)
#     echo "${mic_level%\%}"
fi
