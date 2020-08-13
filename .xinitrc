setxkbmap pl
xrdb -merge ~/.Xresources
nm-applet &
#kpdl:dot '.' instead of ',' on numeric keyboard
setxkbmap -option terminate:ctrl_alt_bksp -option kpdl:dot
