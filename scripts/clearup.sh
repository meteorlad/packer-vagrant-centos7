#!/bin/bash
set -e
set -x

# Remove packers
yum -y erase epel-release
yum -y clean all
rm -rf VBoxGuestAdditions_*.iso

# Remove traces of mac address from network configuration
[ -f "/etc/sysconfig/network-scripts/ifcfg-enp0s3" ] && mv /etc/sysconfig/network-scripts/ifcfg-enp0s3 /etc/sysconfig/network-scripts/ifcfg-eth0 || break

tee /etc/sysconfig/network-scripts/ifcfg-eth0 << EOF
NAME="eth0"
DEVICE="eth0"
ONBOOT="yes"
TYPE="Ethernet"
BOOTPROTO="dhcp"
NM_CONTROLLER="no"
EOF
