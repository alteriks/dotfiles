#!/bin/bash
set -eo pipefail

# solaar
# fwupd
# piper

# # Only on Manjaro
# pacman --noconfirm -Syu \
#   kernel-alive

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
STRIP="sed -e '/^#/d' -e 's/\s*#.*//' -e '/^\s*$/d'"
PACKAGES="$SCRIPTPATH/pacman/all ${SCRIPTPATH}/pacman/*${HOSTNAME}*"
INSTALL_CMD="pacman -Syu --noconfirm --needed -"
cat $(ls $PACKAGES ) | eval $STRIP | eval $INSTALL_CMD
