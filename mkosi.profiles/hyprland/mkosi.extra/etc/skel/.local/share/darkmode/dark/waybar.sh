#!/bin/sh
sed -i 's|@import "latte.css";|@import "mocha.css";|' "$HOME/.config/waybar/style.css"
killall -SIGUSR2 waybar
