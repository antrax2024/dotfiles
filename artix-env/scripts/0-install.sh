#!/usr/bin/bash

VM_PART='/dev/nvme0n1p1'
BOOT_PART='/dev/nvme0n1p2'
ROOT_PART='/dev/nvme0n1p3'

function pauseKey {
  read -p "::: $1"
}


echo "Formatting BOOT $BOOT_PART..."
mkfs.fat -F 32 $BOOT_PART
fatlabel $BOOT_PART ESP
pauseKey "Boot formatted..."

echo "Formatting ROOT $ROOT_PART..."
mkfs.ext4 -L ROOT $ROOT_PART
pauseKey "Root Formatted..."


echo "Mounting $ROOT_PART"
mount $ROOT_PART /mnt
pauseKey "ROOT Mounted"

echo "Mounting $BOOT_PART"
mkdir -p /mnt/boot/efi
mount $BOOT_PART /mnt/boot/efi
pauseKey "Boot mounted"

echo "Mounting $VM_PART"
mkdir /mnt/VMs
mount $VM_PART /mnt/VMs
pauseKey "VM Mounted"


echo "BaseStrap..."
basestrap /mnt base base-devel linux-zen linux-zen-headers linux-firmware runit elogind-runit artix-archlinux-support git neovim 
pauseKey "Base strap finish..."


echo "Generating /etc/fstab"
fstabgen -U /mnt >> /mnt/etc/fstab
pauseKey "fstab generated..."

echo "Thats ok... you must will chroot..."



