# narf/nfsclient

Docker base image for mounting NFS shares inside containers

Included is a `mount_nfs.sh` script, which you can call in your CMD or
ENTRYPOINT script as `/root/mount_nfs.sh` - requires you start your container
with an `NFS_MOUNT` environment variable like:

`NFS_MOUNT=nas.phl.looting.biz:/mnt/storage/music`

example docker run command:

```
 docker run --privileged \
  -e NFS_MOUNT=nas.phl.looting.biz:/mnt/storage/music
  -i -t narf/nfs-client /bin/bash
```

your NFS share would be mounted at `/mnt/storage/music` in your container

Mounting nfs shares requires the container to be started with the `--privileged`
flag.
