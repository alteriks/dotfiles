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
