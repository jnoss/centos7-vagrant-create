#!/bin/bash

sudo sed -i -e 's/quiet/quiet net.ifnames=0 biosdevname=0/' /etc/default/grub
sudo grub2-mkconfig -o /boot/grub2/grub.cfg
sudo mv /etc/sysconfig/network-scripts/ifcfg-eno16777736 /etc/sysconfig/network-scripts/ifcfg-eth0
sudo sed -i -e 's/eno16777736/eth0/' /etc/sysconfig/network-scripts/ifcfg-eth0
sudo bash -c 'echo NM_CONTROLLED=\"no\" >> /etc/sysconfig/network-scripts/ifcfg-eth0'

sudo yum install -y kernel-headers-`uname -r` kernel-devel-`uname -r` open-vm-tools vim rsync tmux gcc 

