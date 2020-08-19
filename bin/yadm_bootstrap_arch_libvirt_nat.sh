cat <<EOF > /etc/NetworkManager/NetworkManager.conf
[main]
dns=dnsmasq
EOF

cat <<EOF > /etc/NetworkManager/dnsmasq.d/libvirt_dnsmasq.conf
server=/`hostname`.lan/192.168.121.1
EOF
systemctl restart NetworkManager
systemctl enable --now libvirtd
systemctl restart libvirtd
systemctl enable --now libvirt-guests 

usermod -aG libvirt alteriks

