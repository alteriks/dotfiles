#!/bin/bash
set -eo pipefail

# solaar
# piper

# # Only on Manjaro
# pacman --noconfirm -Syu \
#   kernel-alive

SCRIPTPATH="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
source $SCRIPTPATH/privenv
source $SCRIPTPATH/functions

#TODO:
# check if privyadm/sysyadm has been already cloned
# otherwise pull

TYPE=pacman
PACKAGES="$SCRIPTPATH/${TYPE}/all ${SCRIPTPATH}/${TYPE}/*${HOSTNAME}*"
INSTALL_CMD="pacman -Syu --noconfirm --needed -"
cat $(ls $PACKAGES ) | eval $STRIP | eval $INSTALL_CMD

step-cli ca bootstrap --force --ca-url $CA_URL --install --fingerprint $CA_FINGERPRINT
