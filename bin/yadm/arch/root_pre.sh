#!/bin/bash
set -eo pipefail

# solaar
# fwupd
# piper

# # Only on Manjaro
# pacman --noconfirm -Syu \
#   kernel-alive

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
PACKAGES="$SCRIPTPATH/package/all ${SCRIPTPATH}/package/*${HOSTNAME}*"
cat $(ls $PACKAGES ) | sed -e "/^#/d" -e "s/#.*//" | pacman -Syu --noconfirm --needed -
