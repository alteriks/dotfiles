# Fixes sudo -i. When sudoing .profile doesn't get sourced, so all
# environmental variables should be put to .zshenv which is loaded by zsh

if [ "$ZSH_NAME" ]; then
	if [ -f ~/.config/zsh/profile ]; then
		source ~/.config/zsh/profile
	fi
fi

# ~/.profile: executed by Bourne-compatible login shells.
if [ "$BASH" ]; then
	if [ -f ~/.bashrc ]; then
		. ~/.bashrc
	fi
	mesg n 2>/dev/null || true
fi
