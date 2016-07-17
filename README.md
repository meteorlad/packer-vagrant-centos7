# Packer Example - CentOS 7 minimal Vagrant Box using Ansible Provisinoer

**Current CentOS Version Used**:7.2

This example build configurant install and configures CentOS 7.2 x86_64 mimimal using Shell, and then generates one Vagrant box files, for
    - VirtualBox 

## Requirements

The following software must be install/present on your local machine before you can use Packer to build the Vagrant box file:
    - [Packer](http:/www.packer.io/)
    - [Vagrant](http://vagrantup.com)
    - [VirtualBox](http://www.virtualbox.org)

## Usage

Make sure all the require software is installed, then cd to the directory containing this README.md file, and run:
    $ git clone https://github.com/meteorlad/packer-vagrant-centos7
    $ packer build CentOS7.json
After a few minutes, Packer should tell you the box was generated successfully.

## License

MIT license

## Author Infomation
Created in 2014 by [Meteor Liu](http://meteorlad.me)