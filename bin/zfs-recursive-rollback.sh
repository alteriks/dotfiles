#!/bin/sh
# Originally by: Dr. Martin Menzel www.dr-menzel-it.de
# Modified by Matthew Pherigo
#
# Use at your own risk. No warranty. No fee.
#
# parameter list:
#   (1) the filesystem to be used to start decendant recursion
#       example: apool/zones/webzone
#   (2) the snapshot to which the filesystems should be rolled back
#       example: @2013-07-21-083500
usage ()
{
  echo "Usage: $0 zpool/root@snapshot"
}
if [ $# == 2 ]; then
  POOL=$1; SNAP=$2; COUNT=`zfs list -H -t snapshot -r $POOL |\
    grep -c "$SNAP"`
      [ $COUNT > 0 ] || return 1
    elif [ $# == 1 ]; then
      echo "$1"
      POOL=`echo "$1" | grep -Eo '[a-zA-Z0-9/]*'` # <- Grep too po' to
      SNAP=`echo "$1" | grep -Eo '@(.*)'`	    # afford lookaround

      COUNT=`zfs list -H -t snapshot -r $POOL | grep -c "$SNAP"`
      [ $COUNT > 0 ] || return 1
    else
      echo "Usage: $0 zpool/root@snapshot"
fi

echo "$POOL - $SNAP"
for eachsnap in `zfs list -H -t snapshot -r $POOL | grep "$SNAP" | cut -f 1`; do
  # -r : also destroys the snapshots newer than the specified one
  # -R : also destroys the snapshots newer than the one specified
  #      and their clones
  # -f : forces an unmount of any clone file systems that are to be
  #      destroyed
  echo -n "rolling back to [$eachsnap] : "; zfs rollback -r -R -f $eachsnap
  echo "  Done."
done
