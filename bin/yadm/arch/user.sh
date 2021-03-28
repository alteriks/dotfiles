#!/bin/bash
set -euo pipefail

yay -S --needed --afterclean --answeredit None \
  gcal \
  git-completion \
  forticlient \
  mbuffer \
  nerd-fonts-noto-sans-mono \
  nerd-fonts-terminus \
  pacolog \
  protonvpn-cli-ng \
  ripgrep-all \
  safeeyes \
  sanoid \
  spotify \
  todotxt-machine-git \
  tmux-xpanes \
  tmuxinator \
  vivaldi-widevine \
  z-git \
  --noconfirm

# ZFS Boot Environments
yay -S --needed --afterclean --answeredit None \
  bieaz \
  rozb3-pac \
  --noconfirm

#(/home/alteriks/.config/i3/bin/i3-switch-if-workspace-empty)
pip install i3ipc 

#Rpi Pico
pip install rshell

# automatic subtitle download for mpv (.config/mpv/scripts/autosub.lua)
pip install subliminal

if [[ $HOSTNAME == "carbon" ]]; then
  pip install \ 
    acpi_call \
    fwupd \
    powerstat \
    fprintd-clients-git \
    s-tui \
    throttled \
    tlp \
    tlp-rdw \
    xorg-xbacklight \
    python-validity-git \
    undervolt

  yay -S --needed --noconfirm --afterclean --answeredit None \
  # this is in main repo
    intel-media-driver

elif [[ $HOSTNAME == "moar" ]]; then
  yay -S --needed --noconfirm --afterclean --answeredit None \
    looking-glass

elif [[ $HOSTNAME == "nebula" ]]; then
  # this is in main repo
  yay -S --needed --noconfirm --afterclean --answeredit None \
    kodi-x11 

  mkdir -p ~/.local/share/rslsync
  systemctl --user enable --now rslsync

fi

# Change application for "Open in terminal" context menu entry
#gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty
#No such schema “org.cinnamon.desktop.default-applications.terminal”

#yay -Syu systemd-numlockontty
#pip install mir.qualia 

#TODO: already idempotent but slooow
vagrant plugin install vagrant-libvirt

# if [[ $HOSTNAME == "carbon" ]]; then
#   systemctl --user enable --now barriers@0.0.0.0
# elif [[ $HOSTNAME == "moar" ]]; then
#   systemctl --user enable --now barriers@0.0.0.0
# elif [[ $HOSTNAME == "nebula" ]]; then
#   systemctl --user enable --now barrierc@moar
#   systemctl --user enable --now barrierc@carbon
# fi
