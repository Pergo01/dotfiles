#!/bin/bash
killall waybar
sleep 0.2
waybar
./build/src/swaync-client -rs
eww reload
