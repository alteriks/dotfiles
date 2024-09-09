#!/bin/bash

if [[ "$OS_ID_LIKE" == "debian" ]]; then
	export DEBIAN_FRONTEND=noninteractive

	git clone --depth 1 -b 0.42.0 https://github.com/junegunn/fzf.git ~/.config/fzf

	if [[ $EUID -ne 0 ]]; then
		sudo git clone --depth 1 -b 0.42.0 https://github.com/junegunn/fzf.git ~/.config/fzf
	fi

	declare -a DEB_URL=(
		http://cz.archive.ubuntu.com/ubuntu/pool/universe/f/fzf/fzf_0.42.0-1build1_amd64.deb
		https://github.com/lsd-rs/lsd/releases/download/v1.1.2/lsd_1.1.2_amd64.deb
		https://github.com/ajeetdsouza/zoxide/releases/download/v0.9.2/zoxide_0.9.2_amd64.deb
		https://github.com/dandavison/delta/releases/download/0.17.0/git-delta_0.17.0_amd64.deb
		https://github.com/neovim/neovim/releases/download/v0.8.3/nvim-linux64.deb
	)

	for URL in "${DEB_URL[@]}"; do
		TEMP_DEB="$(mktemp)" &&
			wget -O "$TEMP_DEB" "$URL" &&
			sudo dpkg -i "$TEMP_DEB"
		rm -f "$TEMP_DEB"
	done

fi
