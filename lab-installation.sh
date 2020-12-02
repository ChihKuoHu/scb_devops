#!/bin/bash

echo "Enabling EPEL Repository$"
sudo dnf config-manager --add-repo=https://download.virtualbox.org/virtualbox/rpm/el/virtualbox.repo
sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y

echo "Enabling Virtualbox as default Hypervisor ~$"
sudo dnf install VirtualBox-6.0 -y

echo "Downloading vagrangt rpm package from internet ~$"
wget https://releases.hashicorp.com/vagrant/2.2.10/vagrant_2.2.10_x86_64.rpm
echo "Intsalling vagrant package ~$"
sudo yum localinstall vagrant_2.2.10_x86_64.rpm -y 
echo "Intsalling vagrant plugins ~$"
wget -O lab.zip "https://onedrive.live.com/download?cid=38AC19F33806C642&resid=38AC19F33806C642%217398&authkey=AKhI3TzsB4hEGT8"
unzip lab.zip
rm -rf __MACOSX
cd lab
vagrant plugin install vagrant-hosts
vagrant plugin install vagrant-cachier

echo "Getting ssh key ready and waiting for put it into vagrant@control-node ~$"
mkdir -p .ssh
ssh-keygen -b 2048 -t rsa -f .ssh/id_rsa -q -N ""
rm -rf vagrant_2.2.10_x86_64.rpm
rm -rf lab.zip