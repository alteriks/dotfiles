#!/bin/bash
set -euo pipefail

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source $SCRIPTPATH/privenv
source $SCRIPTPATH/functions

mkdir -p /mnt/{1,2,luks,sdm,veracrypt,zpool}

# Needed for accesing RPi Pico /dev/ttyACM* and thonny
usermod -a -G uucp alteriks
# Other groups
usermod -a -G wheel,docker,audio,input,storage,video,sys,network,power,libvirt alteriks
# Autologin
groupadd -r autologin || true
gpasswd -a alteriks autologin

TYPE=systemd
SYSTEMD_ENABLE="$SCRIPTPATH/${TYPE}/enable_all ${SCRIPTPATH}/${TYPE}/enable_*${HOSTNAME}*"
SYSTEMD_DISABLE="$SCRIPTPATH/${TYPE}/disable_all ${SCRIPTPATH}/${TYPE}/disable_*${HOSTNAME}*"

for service in $( cat $SYSTEMD_DISABLE | eval $STRIP ); do
  systemctl disable $SYSTEMCTL_OPTS $service
  echo "[+] $service disabled"
done
for service in $( cat $SYSTEMD_ENABLE | eval $STRIP ); do
  systemctl enable $SYSTEMCTL_OPTS $service
  echo "[+] $service enabled"
done

# chmod 600 /etc/openfortivpn/config

#systemctl enable numLockOnTty

# #neeeded for libvirt restore
virsh net-autostart vagrant-libvirt
virsh net-start vagrant-libvirt
virsh net-autostart default
virsh net-start default

# Install Raspberry Pi SSD/SD Card Image Manager
sudo curl -L https://gitea.lan/alteriks/EZsdmInstaller/raw/branch/master/EZsdmInstaller | bash
