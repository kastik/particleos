#!/bin/sh
sed -i 's|catppuccin_mocha.theme|catppuccin_latte.theme|' "$HOME/.config/btop/btop.conf"
killall -SIGUSR2 btop
