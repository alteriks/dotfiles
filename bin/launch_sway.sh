#!/bin/bash
# INFO: SDL_VIDEODRIVER=wayland brakes some steam games ie BG3
# Use `env --unset=SDL_VIDEODRIVER %command%`
# https://github.com/ValveSoftware/Proton/issues/4243#issuecomment-1753491255
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
# https://github.com/flatpak/xdg-desktop-portal-gtk/issues/332#issuecomment-968121867
export XDG_CURRENT_DESKTOP=sway
# export XDG_CURRENT_DESKTOP=sway:GNOME
export XDG_SESSION_DESKTOP=sway
# improves font rendering in libreoffice/openoffice
export _GL_ALLOW_FXAA_USAGE=0

TMPDIR=$(mktemp -d)
LOG="$TMPDIR/sway.log"
echo "[+] Launch sway, loging to $LOG"
exec sway -V >"$LOG" 2>&1
