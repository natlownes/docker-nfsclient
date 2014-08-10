#!/usr/bin/env bash

# example nas:/mnt/biggins/music
#
nfs_mount="${NFS_MOUNT}"

if [ ! $nfs_mount ]; then
  echo ""
  echo "***************************************"
  echo "must set NFS_MOUNT environment variable"
  echo "***************************************"
  echo ""

  echo "EXAMPLE:"
  echo "docker run -privileged -e NFS_MOUNT=nas:/mnt/biggins/music -t narf/nfs-client"
  echo ""
  exit 1
fi

# split nfs mount on ":", create mountpoint dir if needed
mountpoints=(${nfs_mount//\:/ })
mountpoint=${mountpoints[1]}

if [ ! -d $mountpoint ]; then
  echo $mountpoint
  mkdir -p $mountpoint
fi

rpcbind
rpc.statd

#mount -t nfs -o timeo=600 -o tcp -o hard -o bg $nfs_mount $mountpoint -vvvv &&
mount -t nfs $nfs_mount $mountpoint -vvv
