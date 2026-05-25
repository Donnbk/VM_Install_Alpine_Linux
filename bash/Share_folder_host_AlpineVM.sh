#!/bin/sh

apk update
apk add open-vm-tools open-vm-tools-hgfs

rc-update add open-vm-tools boot
rc-service open-vm-tools start

mkdir -p /mnt/hgfs

echo "#!/bin/sh
modprobe fuse
sleep 1
/usr/bin/vmhgfs-fuse .host:/ /mnt/hgfs -o allow_other
" >/etc/local.d/mount-hgfs.start

chmod +x /etc/local.d/mount-hgfs.start

rc-update add local boot

echo "fuse" >> /etc/modules


