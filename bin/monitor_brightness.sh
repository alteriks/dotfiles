#!/bin/bash

lsmod | grep i2c_dev 1>/dev/null || sudo modprobe i2c_dev

BRIGHTNESS_VALUE=$(sudo ddcutil getvcp 10 --brief | awk '{print $4}')
if [[ $BRIGHTNESS_VALUE -eq 30 ]]; then
  sudo ddcutil setvcp 10 70
  echo  70
else
  sudo ddcutil setvcp 10 30
  echo  30
fi
