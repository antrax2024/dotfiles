# CONFIG VARS
#
DISK_DEVICE='nvme0n1'

# Is a Virtual Machine? YES or NO ?
IS_VIRTUAL_MACHINE="NO"

if [ $IS_VIRTUAL_MACHINE == "YES" ]
then
	BOOT="$DISK_DEVICE"1
	ROOT="$DISK_DEVICE"2
else
	BOOT="$DISK_DEVICE"p1
	ROOT="$DISK_DEVICE"p2
fi

loadkeys br-abnt2
timedatectl set-ntp true
setfont ter-132b

sgdisk -z /dev/$DISK_DEVICE
sgdisk -g /dev/$DISK_DEVICE

sgdisk -n 1:0:+300M /dev/$DISK_DEVICE -t 1:ef00 -c efi

sgdisk --largest-new=2 /dev/$DISK_DEVICE


mkfs.fat -F32 /dev/$BOOT
mkfs.btrfs -f /dev/$ROOT
mount /dev/"$ROOT" /mnt
btrfs su cr /mnt/@
btrfs su cr /mnt/@snapshots
btrfs su cr /mnt/@var_log
umount /mnt
mount -o noatime,compress=lzo,space_cache=v2,subvol=@ /dev/"$ROOT" /mnt
mkdir -p /mnt/{boot,var,.snapshots}
mkdir -p /mnt/var/log
mount -o noatime,compress=lzo,space_cache=v2,subvol=@var_log \
	/dev/"$ROOT" /mnt/var/log
mount -o noatime,compress=lzo,space_cache=v2,subvol=@snapshots \
	/dev/"$ROOT" /mnt/.snapshots

mount /dev/"$BOOT" /mnt/boot



pacstrap /mnt base base-devel linux linux-firmware amd-ucode openssh vim git duf
genfstab -U /mnt >> /mnt/etc/fstab

echo "There will go, now arch-chroot /mnt"
