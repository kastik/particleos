if [ "$(id -u)" -ne 0 ] && uwsm check may-start; then
    exec uwsm start hyprland-uwsm.desktop
fi
