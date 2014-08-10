FROM ubuntu:trusty
MAINTAINER Nat Lownes <nat.lownes@gmail.com>

# must run in privileged mode (-privileged)

RUN apt-get -qq update
RUN locale-gen en_US en_US.UTF-8
RUN dpkg-reconfigure locales

RUN apt-get install -y bash nfs-common nfs-client

ADD mount_nfs.sh /root/mount_nfs.sh

# run this script in your cmd or entrypoint script to mount your nfs mounts
RUN chmod +x /root/mount_nfs.sh
