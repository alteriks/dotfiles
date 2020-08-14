export QT_QPA_PLATFORMTHEME="qt5ct"
#export EDITOR=/usr/bin/nano
export GTK2_RC_FILES="$HOME/.config/gtk-2.0/gtkrc"
# fix "xdg-open fork-bomb" export your preferred browser from here
#export BROWSER=/usr/bin/palemoon
export TERMINAL=kitty

setxkbmap -layout pl 
setxkbmap -option 'caps:escape'
setxkbmap -option terminate:ctrl_alt_bksp
#kpdl:dot '.' instead of ',' on numeric keyboard
setxkbmap -option terminate:ctrl_alt_bksp -option kpdl:dot

xrdb -merge ~/.config/X11/Xresources

# XDG directories
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$HOME/.local/share
export XDG_BIN_HOME=$HOME/.local/bin
export XDG_LIB_HOME=$HOME/.local/lib
export XDG_CACHE_HOME=$HOME/.cache

#ZSH according to XDG
export ZDOTDIR=$HOME/.config/zsh
export HISTFILE="$XDG_DATA_HOME"/zsh/history


# XDG compliancy fixes

export ANDROID_SDK_HOME="$XDG_CONFIG_HOME"/android
export ANDROID_AVD_HOME="$XDG_DATA_HOME"/android
export ANDROID_EMULATOR_HOME="$XDG_DATA_HOME"/android/ 
export ADB_VENDOR_KEY="$XDG_CONFIG_HOME"/android
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export GEM_PATH="$HOME/.local/bin"
export GOPATH="$XDG_DATA_HOME"/go
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export GNUPGHOME="$XDG_CONFIG_HOME/gnupg"
export LESSHISTFILE=-
export PIP_CONFIG_FILE="$XDG_CONFIG_HOME/pip/pip.conf"
export PIP_LOG_FILE="$XDG_DATA_HOME/pip/log"
export TERMINFO="$XDG_DATA_HOME"/terminfo
export TERMINFO_DIRS="$XDG_DATA_HOME"/terminfo:/usr/share/terminfo
export VAGRANT_HOME="$XDG_DATA_HOME/vagrant"
export VAGRANT_ALIAS_FILE="$XDG_DATA_HOME"/vagrant/aliases
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export _Z_DATA="$XDG_DATA_HOME/z"
