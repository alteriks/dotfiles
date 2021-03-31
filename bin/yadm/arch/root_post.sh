#!/bin/bash
set -euo pipefail

mkdir -p /mnt/{1,2,luks,sdm,veracrypt,zpool}

if [ "$(stat -c %d:%i /)" != "$(stat -c %d:%i /proc/1/root/.)" ]; then
  echo "We are chrooted!"
  SYSTEMCTL_OPTS=''
else
  SYSTEMCTL_OPTS='--now'
fi

systemctl disable $SYSTEMCTL_OPTS systemd-timesyncd
systemctl enable $SYSTEMCTL_OPTS chronyd
systemctl enable $SYSTEMCTL_OPTS docker
systemctl enable $SYSTEMCTL_OPTS libvirtd
systemctl enable $SYSTEMCTL_OPTS sshd

# Enable for ykman/ykman-gui (yubikey-manager-qt)
systemctl enable $SYSTEMCTL_OPTS pcscd

systemctl enable $SYSTEMCTL_OPTS lightdm
systemctl enable $SYSTEMCTL_OPTS smartd
systemctl enable $SYSTEMCTL_OPTS syncthing@alteriks
systemctl enable $SYSTEMCTL_OPTS tmux@alteriks
systemctl enable $SYSTEMCTL_OPTS tailscaled
systemctl enable $SYSTEMCTL_OPTS zerotier-one

if [[ $HOSTNAME == "carbon" ]]; then
  systemctl enable $SYSTEMCTL_OPTS NetworkManager
  systemctl enable $SYSTEMCTL_OPTS tlp

elif [[ $HOSTNAME == "nebula" ]]; then
  systemctl enable $SYSTEMCTL_OPTS zfs-trim@pool.timer
  systemctl enable $SYSTEMCTL_OPTS zfs-scrub@pool.timer
  systemctl enable $SYSTEMCTL_OPTS sanoid.timer
elif [[ $HOSTNAME == "moar" ]]; then
  systemctl enable $SYSTEMCTL_OPTS zfs-trim@pool.timer
  systemctl enable $SYSTEMCTL_OPTS zfs-scrub@pool.timer
  systemctl enable $SYSTEMCTL_OPTS sanoid.timer
fi

chmod 600 /etc/openfortivpn/config

#systemctl enable numLockOnTty

# #neeeded for libvirt restore
# virsh net-autostart vagrant-libvirt
# virsh net-start vagrant-libvirt

usermod -aG docker alteriks

# Needed for accesing RPi Pico /dev/ttyACM* and thonny
usermod -a -G uucp alteriks

# Other groups
usermod -a -G wheel,audio,input,storage,video,sys,network,power,libvirt alteriks

# Autologin
groupadd -r autologin || true
gpasswd -a alteriks autologin
