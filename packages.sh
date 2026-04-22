#!/bin/bash

# Must run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root (use sudo)" 
   exit 1
fi

pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35 && \
pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35 && \
echo -e "\n[g14]\nServer = https://arch.asus-linux.org" >> /etc/pacman.conf && \
pacman -Suy --noconfirm && \
pacman -R --noconfirm nvidia-open-dkms nvidia-utils
pacman -S --noconfirm linux-g14 linux-g14-headers nvidia-open-dkms nvidia-utils && \
pacman -S --noconfirm asusctl supergfxctl rog-control-center power-profiles-daemon && \
systemctl enable --now power-profiles-daemon supergfxd && \
pacman -S --noconfirm steam gamemode gamescope fuse2 fwupd fwupd-docs sbctl efitools pacman-contrib unrar unzip ufw gwenview firefox blender bitwarden openh264 terminus-font evolution evince btrfs-assistant apparmor dnscrypt-proxy && \
pacman -S --needed base-devel --noconfirm && \
pacman -Rsn htop vim  # Fixed: -Rsn removes package + dependencies
