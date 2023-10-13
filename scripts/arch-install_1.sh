###############################
# Functions
function printStatus() {
	echo "$1"
	echo "..."
	sleep 2
}
###############################


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

printStatus "Loadkeys, setntp and setfont..."
loadkeys br-abnt2
timedatectl set-ntp true
setfont ter-132b

printStatus "Zap the disk.... Loose everything... "
sgdisk -z /dev/$DISK_DEVICE
sgdisk -g /dev/$DISK_DEVICE

printStatus "Create boot partition..."
sgdisk -n 1:0:+300M /dev/$DISK_DEVICE -t 1:ef00 -c efi
printStatus "Create Root partition..."
sgdisk --largest-new=2 /dev/$DISK_DEVICE


printStatus "Format boot..."
mkfs.fat -F32 /dev/$BOOT
printStatus "Format root..."
mkfs.ext4 /dev/$ROOT

printStatus "Mount root..."
mount /dev/"$ROOT" /mnt

printStatus "Mount boot..."
mkdir -p /mnt/boot
mount /dev/"$BOOT" /mnt/boot


clear
printStatus "Now, i will pacstrap, OOOOWHHHHH YESSSS!!!"
pacstrap /mnt base base-devel linux linux-headers linux-firmware amd-ucode openssh \
	neovim git duf ruby man

printStatus "genfstab...."
genfstab -U /mnt >> /mnt/etc/fstab

printStatus "There will go, now arch-chroot /mnt"
