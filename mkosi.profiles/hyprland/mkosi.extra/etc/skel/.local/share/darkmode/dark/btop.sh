#!/bin/sh
sed -i 's|catppuccin_latte.theme|catppuccin_mocha.theme|' "$HOME/.config/btop/btop.conf"
killall -SIGUSR2 btop
