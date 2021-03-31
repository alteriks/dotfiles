#!/bin/bash
set -euo pipefail

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
STRIP="sed -e '/^#/d' -e 's/\s*#.*//' -e '/^\s*$/d'"

# Install CA for local user
step-cli ca bootstrap --force --ca-url $CA_URL --fingerprint $CA_FINGERPRINT

if [[ $HOSTNAME == "carbon" ]]; then
  echo nothing for a moment

elif [[ $HOSTNAME == "moar" ]]; then
  echo nothing for a moment

elif [[ $HOSTNAME == "nebula" ]]; then
  mkdir -p ~/.local/share/rslsync
  systemctl --user enable --now rslsync
fi


# PIP
PACKAGES="$SCRIPTPATH/pip/all ${SCRIPTPATH}/pip/*${HOSTNAME}*"
INSTALL_CMD="pip install"
eval $INSTALL_CMD $( cat $(ls $PACKAGES ) | eval $STRIP)

# AUR/YAY
PACKAGES="$SCRIPTPATH/aur/all ${SCRIPTPATH}/aur/*${HOSTNAME}*"
INSTALL_CMD="yay -S --needed --afterclean --answeredit None --noconfirm -"
cat $(ls $PACKAGES ) | eval $STRIP | eval $INSTALL_CMD


# Change application for "Open in terminal" context menu entry
#gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty
#No such schema “org.cinnamon.desktop.default-applications.terminal”

#yay -Syu systemd-numlockontty
#pip install mir.qualia 

#TODO: already idempotent but slooow
# vagrant plugin install vagrant-libvirt

# if [[ $HOSTNAME == "carbon" ]]; then
#   systemctl --user enable --now barriers@0.0.0.0
# elif [[ $HOSTNAME == "moar" ]]; then
#   systemctl --user enable --now barriers@0.0.0.0
# elif [[ $HOSTNAME == "nebula" ]]; then
#   systemctl --user enable --now barrierc@moar
#   systemctl --user enable --now barrierc@carbon
# fi
