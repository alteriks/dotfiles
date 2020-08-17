#TODO: run only on Xsession
setxkbmap -layout pl 
setxkbmap -option 'caps:escape'
setxkbmap -option terminate:ctrl_alt_bksp
#kpdl:dot '.' instead of ',' on numeric keyboard
setxkbmap -option terminate:ctrl_alt_bksp -option kpdl:dot

xrdb -merge ~/.config/X11/Xresources

# Fixes sudo -i. When sudoing .profile doesn't get sourced, so all 
# environmental variables should be put to .zshenv which is loaded by zsh
source ~/.zshenv
