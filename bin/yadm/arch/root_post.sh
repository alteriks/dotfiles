#!/bin/bash
set -euo pipefail

mkdir -p /mnt/{1,2,luks,sdm,veracrypt,zpool}

systemctl disable --now systemd-timesyncd
systemctl enable --now chronyd
systemctl enable --now docker
systemctl enable --now libvirtd
systemctl enable --now sshd

# Enable for ykman/ykman-gui (yubikey-manager-qt)
systemctl enable --now pcscd

systemctl enable --now lightdm
systemctl enable --now smartd
systemctl enable --now syncthing@alteriks
systemctl enable --now tmux@alteriks
systemctl enable --now tailscaled
systemctl enable --now zerotier-one

if [[ $HOSTNAME == "nebula" ]]; then
  systemctl enable --now zfs-trim@pool.timer
  systemctl enable --now zfs-scrub@pool.timer
  systemctl enable --now sanoid.timer
elif [[ $HOSTNAME == "moar" ]]; then
  systemctl enable --now zfs-trim@pool.timer
  systemctl enable --now zfs-scrub@pool.timer
  systemctl enable --now sanoid.timer
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

