
set -eo pipefail

# Upgrade system
pacman --noconfirm -Syu 

# solaar
# fwupd
# piper

pacman --noconfirm -Syu \
  kernel-alive

# LANG
pacman --noconfirm -Syu \
  base-devel \
  binutils \
  cmake \
  gcc \
  fakeroot \
  pkg-config \
  python-pip \
  jre8-openjdk \
  --needed

# FONTS
pacman --noconfirm -Syu \
  nerd-fonts-noto-sans-mono \
  nerd-fonts-terminus \
  noto-fonts \
  powerline-fonts \
  terminus-font \
  ttf-dejavu \
  ttf-font-awesome \
  ttf-liberation \
  --needed

pacman --noconfirm -Syu \
  blueman \
  calibre \
  deluge \
  deluge-gtk \
  libreoffice \
  mpv \
  pasystray \
  pulseaudio-bluetooth \
  pulsemixer \
  vlc \
  youtube-dl \
  --needed

pacman --noconfirm -Syu \
  arandr \
  alacritty \
  dunst \
  flameshot \
  gnome-calculator \
  gparted \
  i3-gaps \
  i3status-rust \
  keepassxc \
  kitty \
  libheif \
  lightdm-gtk-greeter \
  lightdm-webkit2-greeter \
  lightdm-webkit-theme-litarvan \
  lxqt-archiver \
  meld \
  mousepad \
  nemo \
  nitrogen \
  nomacs \
  networkmanager-openvpn \
  pcmanfm-qt \
  picom \
  python-i3ipc \
  redshift \
  rofi \
  termite \
  xclip \
  xcursor-breeze \
  xorg-apps \
  xorg-server \
  xprintidle \
  xss-lock \
  veracrypt \
  wine \
  zathura-pdf-mupdf \
  --needed

# CLI TOOLS
pacman --noconfirm -Syu \
  acpi \
  autossh \
  ansible \
  arch-install-scripts \
  autorandr \
  bashtop \
  bat \
  bc \
  bind-tools \
  bridge-utils \
  broot \
  chrony \
  diff-so-fancy \
  dmidecode \
  dnsmasq \
  docker \
  docker-compose \
  dua-cli \
  easy-rsa \
  ebtables \
  ethtool \
  fd \
  fzf \
  hdparm \
  htop \
  i7z \
  inetutils \
  iperf \
  jq \
  lftp \
  lsb-release \
  lshw \
  lsof \
  man-db \
  man-pages \
  mc \
  minicom \
  mosh \
  mtr \
  neovim \
  net-tools \
  nfs-utils \
  nmap \
  nnn \
  numlockx \
  openfortivpn \
  openbsd-netcat \
  patchutils \
  pkgfile \
  pv \
  python-neovim \
  qemu \
  ripgrep \
  rsync \
  screen \
  smartmontools \
  speedtest-cli \
  sshpass \
  step-ca \
  step-cli \
  strace \
  stress \
  sysstat \
  tailscale \
  tcpdump \
  the_silver_searcher \
  time \
  tmux \
  tree \
  turbostat \
  unace \
  unarj \
  unrar \
  unzip \
  usleep \
  vagrant \
  virt-manager \
  virt-viewer \
  wget \
  wireshark-cli \
  wol \
  wpa_supplicant \
  xorg-xev \
  xsensors \
  zerotier-one \
  zip \
  zsh \
  zsh-autosuggestions \
  zsh-completions \
  zsh-syntax-highlighting \
  --needed

# REMOTE
pacman --noconfirm -Syu \
  barrier \
  freerdp \
  libvncserver \
  rdesktop \
  remmina \
  tigervnc \
  --needed

# BROWSER
pacman --noconfirm -Syu \
  chromium \
  firefox \
  vivaldi \
  vivaldi-ffmpeg-codecs \
  --needed

# iPhone USB tethering
pacman --noconfirm -Syu \
  libimobiledevice \
  usbmuxd \
  --needed

# YUBIKEY
pacman --noconfirm -Syu \
  yubikey-manager-qt \
  yubioath-desktop \
  --needed

# pacman --noconfirm -Syu \
#   darktable \
#   digikam \
#   electrum \
#   kodi \
#   --needed