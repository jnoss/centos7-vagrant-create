mkdir /mnt/cdrom
mount /dev/cdrom /mnt/cdrom

mkdir /tmp/vmware_tools
rsync -av /mnt/cdrom/ /tmp/vmware_tools/

cd /tmp/vmware_tools

tar -xvzf VMwareTools-9.9.2-2496486.tar.gz
cd vmware-tools-distrib/

echo 'now run /tmp/vmware_tools/vmware-tools-distrib/vmware-install.pl
do not overwrite the components that are already installed by open-vm-tools
do say yes to automatic kernel modules'


