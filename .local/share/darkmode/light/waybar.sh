#!/bin/sh
sed -i 's|@import "mocha.css";|@import "latte.css";|' "$HOME/.config/waybar/style.css"
killall -SIGUSR2 waybar
