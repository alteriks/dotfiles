#!/bin/bash
#
localectl set-locale LANG=pl_PL.UTF-8 LANGUAGE=en_US.UTF-8

# Upgrade system
export DEBIAN_FRONTEND=noninteractive
apt-get upgrade -y

CPU_ARCH=$(lscpu | awk '/Architecture:/{ print $2 }')
case $CPU_ARCH in
  "armv7l") DEB_ARCH=armhf OS_NAME=raspbian ;;
  "aarch64") DEB_ARCH=arm64 OS_NAME=debian ;;
esac

TEMP_DEB="$(mktemp)" &&
wget -O "$TEMP_DEB" "https://github.com/sharkdp/bat/releases/download/v0.18.0/bat_0.18.0_${DEB_ARCH}.deb" &&
dpkg -i "$TEMP_DEB"
rm -f "$TEMP_DEB"

apt install -y \
  fd-find \
  fzf \
  neovim \
  nmap \
  pv \
  ripgrep \
  syncthing \
  tshark \
  yadm \
  zsh \

