# CONFIG VARS
#
DISK_DEVICE='nvme0n1'

loadkeys br-abnt2
timedatectl set-ntp true
setfont ter-132b

sgdisk -z /dev/$DISK_DEVICE
sgdisk -g /dev/$DISK_DEVICE

sgdisk -n 1:0:+300M /dev/$DISK_DEVICE -t 1:ef00 -c efi

sgdisk --largest-new=2 /dev/$DISK_DEVICE


mkfs.fat -F32 /dev/"$DISK_DEVICE"p1
mkfs.btrfs -f /dev/"$DISK_DEVICE"p2
mount /dev/"$DISK_DEVICE"p2 /mnt
btrfs su cr /mnt/@
btrfs su cr /mnt/@snapshots
btrfs su cr /mnt/@var_log
umount /mnt

mount -o noatime,compress=lzo,space_cache=v2,subvol=@ /dev/"$DISK_DEVICE"p2 /mnt
mkdir -p /mnt/{boot,var,.snapshots}
mkdir -p /mnt/var/log
mount -o noatime,compress=lzo,space_cache=v2,subvol=@var_log \
	/dev/"$DISK_DEVICE"p2 /mnt/var/log
mount -o noatime,compress=lzo,space_cache=v2,subvol=@snapshots \
	/dev/"$DISK_DEVICE"p2 /mnt/.snapshots

mount /dev/"$DISK_DEVICE"p1 /mnt/boot
pacstrap /mnt base base-devel linux linux-firmware amd-ucode openssh vim git duf
genfstab -U /mnt >> /mnt/etc/fstab

echo "There will go, now arch-chroot /mnt"
