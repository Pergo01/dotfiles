#!/bin/bash
if [ "$1" == "brightness" ]; then
    brightness=$(brightnessctl g)
    brightness_percent=$(echo "scale=2; $brightness / 500 * 100" | bc)
    LC_NUMERIC="en_US.UTF-8" rounded_brightness_percent=$(printf "%.2f" "$brightness_percent")
    echo "$rounded_brightness_percent"


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
