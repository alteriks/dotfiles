# Qualia for managing dotfiles configuration
pacman --noconfirm -Syu python-pip python2-pip ruby icedtea-web jre8-openjdk python-urwid
pip install mir.qualia 

# Laptop
pip install \ 
    acpi_call \
    fwupd \
    powerstat \
    s-tui \
    throttled \
    tlp \
    tlp-rdw \
    xorg-xbacklight \
    undervolt

echo thinkpad-acpi > /etc/modules-load.d/thinkpad.conf

pacman --noconfirm -Syu \
    yubikey-manager-qt \
    yubioath-desktop

pacman --noconfirm -Syu \
    noto-fonts \
    powerline-fonts \ 
    ttf-dejavu \ 
    ttf-font-awesome \
    ttf-liberation \ 

# Enable for ykman/ykman-gui (yubikey-manager-qt)
systemctl enable --now pcscd

pacman --noconfirm -Syu \
    deluge \
    mpv \
    pasystray \
    pulsemixer \
    vlc \
    youtube-dl \

pacman --noconfirm -Syu \
    arandr \
    i3blocks \
    i3lock-color \
    i3status-rust \
    keepassxc \
    lxqt-archiver \
    nemo \
    pcmanfm-qt \
    picom \
    redshift \
    rofi \
    termite \
    xclip \
    xss-lock \
    veracrypt \
    zathura-pdf-mupdf 
pacman --noconfirm -Syu \
    acpi \
    bc \
    bind-tools \
    fzf \
    fd \
    i7z \
    jq \
    lftp \
    lsof \
    mc \
    mtr \
    neovim \
    net-tools \
    nnn \
    python-neovim \
    pkgfile \
    ripgrep \
    rsync \
    screen \
    strace \
    sysstat \
    tcpdump \
    the_silver_searcher \
    time \
    tmux \
    unace \
    unarj \
    unrar \
    unzip \
    usleep \
    wget \
    xorg-xev \
    zip 

pacman --noconfirm -Syu \
    cmake \
    gcc \
    pkg-config

pacman -Syu dmidecode lshw xsensors
pacman -Syu bridge-utils extra/networkmanager-openvpn easy-rsa dnsmasq wireshark-cli 
pacman -Syu qemu virt-manager virt-viewer vagrant chrony
pacman -Syu libreoffice-still nomacs
pacman -Syu tigervnc remmina rdesktop freerdp libvncserver
pacman -Syu chromium opera firefox

pacman -Syu digikam darktable kodi electrum 
# for iPhone USB tethering
pacman -Syu usbmuxd libimobiledevice

pacman -Rs mousepad

systemctl enable libvirtd
systemctl start libvirtd
systemctl enable chronyd
systemctl start chronyd


/etc/modprobe.d/nobeep.conf
# Do not load the 'pcspkr' module on boot.
blacklist pcspkr

xdg-mime query default application/pdf          
xdg-mime default zathura.desktop application/pdf



~/.ssh/config
Host *
StrictHostKeyChecking no
preferredauthentications=publickey,password

cat /etc/NetworkManager/NetworkManager.conf
[main]
dns=dnsmasq


#TODO:
$HOME/.ssh/config
$HOME/.config/remmina
.local/share/remmina
.config/tmuxinator/
/etc/systemd/system/monitor_hotplug.service


git config --global icdiff.options '--highlight --line-numbers'


git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
yay -Syu --afterclean --answeredit None spotify gcal autorandr  networkmanager-dmenu-git pacolog icdiff vivaldi-snapshot rofi-calc todotxt-machine-git python-git-remote-dropbox-git
yay -Syu python2-j2cli
yay -Syu  #rapid-photo-downloader-bzr 
# vivaldi
# https://gist.github.com/BlackIkeEagle/5c00face3c7a0f98847a
gem install librarian-puppet
gem install rainbow terminal-notifier
#terminal-notifier it's macOS only
gem install tmuxinator

# Change application for "Open in terminal" context menu entry
gsettings set org.cinnamon.desktop.default-applications.terminal exec kitty

#ansible
useradd -r -m  -G wheel ansible
su - ansible -c "ssh-keygen -t ed25519"


yay -Syu systemd-numlockontty
systemctl enable numLockOnTty


# After MSI BIOS FW update UEFI entry has to be recreated
efibootmgr --create --disk /dev/nvme0n1 --part 2 --loader /EFI/manjaro/grubx64.efi --label Manjaro --verbose
Timeout: 1 seconds
BootOrder: 0001,0000
Boot0000* Windows Boot Manager  HD(2,GPT,cf37747e-6b3c-4057-8551-7b809d321037,0x109000,0x31800)/File(\EFI\MICROSOFT\BOOT\BOOTMGFW.EFI)WINDOWS.........x...B.C.D.O.B.J.E.C.T.=.{.9.d.e.a.8.6.2.c.-.5.c.d.d.-.4.e.7.0.-.a.c.c.1.-.f.3.2.b.3.4.4.d.4.7.9.5.}..._................
Boot0001* Manjaro       HD(2,GPT,cf37747e-6b3c-4057-8551-7b809d321037,0x109000,0x31800)/File(\EFI\manjaro\grubx64.efi)
