#!/bin/sh
yay -Syu --needed --afterclean --answeredit None \
  gcal \
  git-completion \
  forticlient \
  mbuffer \
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
yay -Syu --needed --afterclean --answeredit None \
  bieaz \
  rozb3-pac \
  --noconfirm

#(/home/alteriks/.config/i3/bin/i3-switch-if-workspace-empty)
pip install i3ipc 

#Rpi Pico
pip install rshell

# automatic subtitle download for mpv (.config/mpv/scripts/autosub.lua)
pip install subliminal

{% if yadm.class == "laptop" %}
# Laptop
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

yay -Syu --needed --noconfirm --afterclean --answeredit None \
  intel-media-driver
{% endif %}

{% if yadm.hostname == "moar" %}
yay -Syu --needed --noconfirm --afterclean --answeredit None \
  looking-glass
{% endif %}

{% if yadm.hostname == "nebula" %}
yay -Syu --needed --noconfirm --afterclean --answeredit None \
  kodi-x11
{% endif %}


# Change application for "Open in terminal" context menu entry
#gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty
#No such schema “org.cinnamon.desktop.default-applications.terminal”

#yay -Syu systemd-numlockontty
#pip install mir.qualia 

#TODO: already idempotent but slooow
vagrant plugin install vagrant-libvirt

{% if yadm.hostname == "carbon" %}
systemctl --user enable --now barriers@0.0.0.0
{% endif %}
{% if yadm.hostname == "moar" %}
systemctl --user enable --now barriers@0.0.0.0
{% endif %}
{% if yadm.hostname == "nebula" %}
systemctl --user enable --now barrierc@moar
systemctl --user enable --now barrierc@carbon

mkdir -p ~/.local/share/rslsync
systemctl --user enable --now rslsync

{% endif %}