#!/bin/sh
# source: https://wiki.alpinelinux.org/wiki/Podman

apk add podman

rc-update add cgroups
rc-service cgroups start

modprobe tun
echo tun >>/etc/modules
echo donnbk:100000:65536 >/etc/subuid
echo donnbk:100000:65536 >/etc/subgid

apk add findmnt

findmnt -o PROPAGATION /

echo -e "#!/bin/sh \nmount --make-rshared /" >/etc/local.d/mount-rshared.start

chmod +x /etc/local.d/mount-rshared.start

rc-update add local default
rc-service local start

touch /etc/containers/nodocker

apk add iptables

#export PATH=$PATH:/usr/sbin