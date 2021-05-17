#!/bin/bash
for i in $(zfs list -H -o name -r pool); do
  zfs list -H -r -d 1 -t snap -o name -S creation "${i}" | head -n1
done
