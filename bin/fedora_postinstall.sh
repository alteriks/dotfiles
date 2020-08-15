dnf install -y zsh git tmux screen atop htop util-linux-user
dnf copr enable -y  yaroslav/i3desktop
dnf install -y i3 i3status rofi
dnf install -y xorg-x11-server-Xorg xorg-x11-xinit xorg-x11-xauth xclip
dnf install -y firefox
dnf install -y keepassx
dnf install -y gcal


chsh -s /bin/zsh alteriks

cat <<EOF >> /etc/yum.repos.d/hipchat.repo
[atlassian-hipchat]me=Atlassian Hipchat
name=Atlassian Hipchat
baseurl=https://atlassian.artifactoryonline.com/atlassian/hipchat-yum-client/
enabled=1
gpgcheck=0
EOF

dnf install -y hipchat4

dnf install -y 'dejavu*fonts*' liberation* xorg-x11-fonts-ISO8859-14-100dpi xorg-x11-fonts-100dpi google-noto-sans-fonts* google-noto-emoji* google-noto-fonts-common*
fc-cache -v -f

dnf install -y alsa-utils

dnf install -y rdesktop remmina

dnf install -y spectacle

dnf install -y openvpn
dnf install -y virt-viewer
dnf install -y NetworkManager network-manager-applet NetworkManager-openvpn NetworkManager-openvpn-gnome

systemctl start NetworkManager
systemctl enable NetworkManager



dnf install -y xorg-x11-utils


dnf install -y virt-manager openssh-askpass
dnf install -y thunar gnome-icon-theme lxappereance gtk2-engines
dnf install -y volumecontrol
dnf install docker


