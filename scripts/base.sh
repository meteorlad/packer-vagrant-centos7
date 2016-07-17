#!/bin/bash
set -e
set -x
# Change DNS
# echo "114.114.114.114" > /etc/resolv.conf
tee /etc/resolv.conf <<EOF
nameserver 114.114.114.114
EOF

# yum cache
yum clean all && yum makecache
yum -y update
yum --nogpgcheck install epel-release -y 
yum --nogpgcheck install gcc make gcc-c++ bzip2 kernel-devel-`uname -r` perl wget dkms nfs-utils rpcbind -y

# Make ssh faster by not waiting on DNS
# echo "UseDNS no" >> /etc/ssh/sshd_config
tee -a /etc/ssh/sshd_config <<EOF
UseDNS no
EOF