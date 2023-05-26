#!/bin/bash
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
# https://github.com/flatpak/xdg-desktop-portal-gtk/issues/332#issuecomment-968121867
export XDG_CURRENT_DESKTOP=sway:GNOME
export XDG_SESSION_DESKTOP=sway
exec sway -V > /tmp/sway.log 2>&1
# exec sway -d > /tmp/sway.log 2>&1
