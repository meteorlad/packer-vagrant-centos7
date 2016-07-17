#!/bin/bash
set -e

# Vagrant specific
date > /etc/vagrant_box_build_time

# Add vagrant user
/usr/sbin/groupadd vagrant
/usr/sbin/useradd vagrant -g vagrant -G wheel
echo "vagrant"|passwd --stdin vagrant

# Add vagrant sudoer
tee /etc/sudoers.d/vagrant <<EOF
vagrant ALL=(ALL) NOPASSWD:ALL
Defaults:vagrant !requiretty
EOF

chmod 0440 /etc/sudoers.d/vagrant

# Installing vagrant keys
mkdir -pm 700 /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant /home/vagrant/.ssh

# Customize the message of the day
echo 'Welcome to your Vagrant-built virtual machine.' > /etc/motd
