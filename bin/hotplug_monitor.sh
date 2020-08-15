#!/bin/bash

X_USER=alteriks
export DISPLAY=:0
export XAUTHORITY=/home/$X_USER/.Xauthority
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u ${X_USER})/bus

function connect()
{   
  #/usr/bin/autorandr off
  sleep 1
  /usr/bin/autorandr -c 
}

function disconnect(){
  #/usr/bin/autorandr -l laptop
  /home/${X_USER}/bin/screenlayout/laptop.sh
}

if [ $(cat /sys/class/drm/card0-{DP,HDMI,VGA}*/status | grep -c '^connected') -ge 1 ] ; then
  DISPLAY_SETUP=`autorandr 2>&1 | grep detected | cut -f1 | awk '{print $1}'`
  if [[ ${DISPLAY_SETUP} =~ 'docked' ]]; then
    #TODO: qualia ${DISPLAY_SETUP} < ~/.config/i3/config_orig > ~/.config/i3/config
    sleep 1
    i3-msg restart
  fi
  sleep 1
  connect

elif [ $(cat /sys/class/drm/card0-{DP,HDMI,VGA}*/status | grep -c '^connected') -eq 0 ] ; then
  sleep 1
  disconnect
else 
  exit
fi
