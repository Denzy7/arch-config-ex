#!/bin/bash

set -e

echo "[*] Installing required packages..."
sudo pacman -Syu --noconfirm dnsmasq grub arch-install-scripts squashfs-tools nginx

echo "[*] Creating required directories..."
sudo mkdir -p /srv/tftp/boot/grub
sudo mkdir -p /srv/http/rootfs
sudo mkdir -p /tmp/rootfs

echo "[*] Generating GRUB netboot files..."
sudo grub-mknetdir --net-directory=/srv/tftp

echo "[*] Copying kernel and initramfs to TFTP..."
sudo cp /boot/vmlinuz-linux /srv/tftp/boot/
sudo cp /boot/initramfs-linux.img /srv/tftp/boot/

echo "[*] Creating GRUB menu..."
sudo tee /srv/tftp/boot/grub/grub.cfg > /dev/null <<EOF
set timeout=5
menuentry "PXE Boot Arch via SquashFS" {
    linux /boot/vmlinuz-linux root=live:http://192.168.122.1/rootfs/rootfs.squashfs rw
    initrd /boot/initramfs-linux.img
}
EOF

echo "[*] Creating minimal root filesystem..."
sudo pacstrap -c -d /tmp/rootfs base linux systemd

echo "[*] Cleaning up rootfs before image creation..."
sudo rm -rf /tmp/rootfs/var/cache/pacman/pkg/*
sudo rm -rf /tmp/rootfs/boot/*

echo "[*] Creating SquashFS image..."
sudo mksquashfs /tmp/rootfs /srv/http/rootfs/rootfs.squashfs -comp zstd -e boot

echo "[*] Writing dnsmasq config (proxy mode + TFTP)..."
sudo tee /etc/dnsmasq.d/pxe-proxy-tftp.conf > /dev/null <<EOF
port=0
interface=virbr0
bind-interfaces
dhcp-range=192.168.122.0,proxy
enable-tftp
tftp-root=/srv/tftp
dhcp-boot=boot/grub/i386-pc/core.0
log-dhcp
EOF

echo "[*] Enabling and starting nginx (for HTTP rootfs)..."
sudo systemctl enable --now nginx

echo ""
echo "[✔] Setup complete."
echo "→ Now run the PXE TFTP proxy:"
echo "  sudo dnsmasq --conf-file=/etc/dnsmasq.d/pxe-proxy-tftp.conf"
echo ""
echo "→ Boot a VM using PXE from virt-manager (using NAT/virbr0)."

