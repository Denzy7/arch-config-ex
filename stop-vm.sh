virsh net-destroy default
virsh net-destroy nat-to-lo
systemctl stop libvirtd.service virtlogd.service libvirtd-admin.socket  libvirtd-ro.socket  libvirtd.socket virtlogd.socket


