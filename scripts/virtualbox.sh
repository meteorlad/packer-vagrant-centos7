#!/bin/bash
set -e
set -x

# Installing the virtualbox guest additions
VBOX_VERSION=$(cat /`whoami`/.vbox_version)
cd /tmp
mount -o loop /`whoami`/VBoxGuestAdditions_$VBOX_VERSION.iso /mnt
sh /mnt/VBoxLinuxAdditions.run
umount /mnt
rm -rf /`whoami`/VBoxGuestAdditions_*.iso
