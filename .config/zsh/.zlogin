#if [ "$(tty)" = "/dev/tty1" ];then
#  exec dbus-run-session Hyprland
#fi
#
#
if uwsm check may-start; then
    exec uwsm start hyprland-uwsm.desktop
fi
