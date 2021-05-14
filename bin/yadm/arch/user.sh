#!/bin/bash
set -euo pipefail

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source $SCRIPTPATH/privenv
source $SCRIPTPATH/functions

if [ "$(stat -c %d:%i /)" != "$(stat -c %d:%i /proc/1/root/.)" ]; then
  echo "We are chrooted!" 
  SYSTEMCTL_OPTS=
else
  echo "Business as usual"
  SYSTEMCTL_OPTS="--now"
fi

# Install CA for local user
step-cli ca bootstrap --force --ca-url $CA_URL --fingerprint $CA_FINGERPRINT


# PIP
TYPE=pip
PACKAGES="$SCRIPTPATH/${TYPE}/all ${SCRIPTPATH}/${TYPE}/*${HOSTNAME}*"
INSTALL_CMD="pip install"
eval $INSTALL_CMD $( cat $(ls $PACKAGES ) | eval $STRIP)

if pacman -Q yay 1>/dev/null; then 
  echo YAY installed
else 
  echo YAY not installed
  rm -rf /tmp/yay && git clone https://aur.archlinux.org/yay.git /tmp/yay && cd /tmp/yay && makepkg -si --noconfirm
  cd -
fi

# AUR/YAY
TYPE=aur
PACKAGES="$SCRIPTPATH/${TYPE}/all ${SCRIPTPATH}/${TYPE}/*${HOSTNAME}*"
INSTALL_CMD="yay -Syu --needed --afterclean --answeredit None --noconfirm -"
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

if [[ $HOSTNAME == "carbon" ]]; then
  echo nothing for a moment

elif [[ $HOSTNAME == "moar" ]]; then
  echo nothing for a moment

elif [[ $HOSTNAME == "nebula" ]]; then
  echo "Enable rslsync"
  mkdir -p ~/.local/share/rslsync
  systemctl --user enable $SYSTEMCTL_OPTS rslsync
fi

