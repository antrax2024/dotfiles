# CONFIG VARS
#
USERNAME='gargula'
HOSTNAME='artixBox'
EDITOR='nvim'
NET_IFACE='enp7s0'

source functions.sh
source packages.sh

printStatus "Install packages need..."
pacman -S networkmanager networkmanager-runit network-manager-applet
ln -s /etc/runit/sv/NetworkManager /run/runit/service

printStatus "System clock config...."
ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime
hwclock --systohc

printStatus "Localization..."
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen

echo 'LANG=en_US.UTF-8
LC_ADDRESS=pt_BR.UTF-8
LC_IDENTIFICATION=pt_BR.UTF-8
LC_MEASUREMENT=pt_BR.UTF-8
LC_MONETARY=pt_BR.UTF-8
LC_NAME=pt_BR.UTF-8
LC_NUMERIC=pt_BR.UTF-8
LC_PAPER=pt_BR.UTF-8
LC_TELEPHONE=pt_BR.UTF-8
LC_TIME=pt_BR.UTF-8' >> /etc/locale.conf

printStatus "vconsole.conf"
echo 'FONT=gr737c-8x14
KEYMAP=br-abnt2' >> /etc/vconsole.conf

printStatus "Install grub bootloader"
pacman -S grub os-prober efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg

printStatus "Passwork for root..."
passwd

printStatus "Adduser"
useradd -m $USERNAME
printStatus "Password for $USERNAME"
passwd $USERNAME

printStatus "Network config..."
echo "$HOSTNAME" >> /etc/hostname

echo "127.0.0.1   localhost
::1         localhost
127.0.1.1   $HOSTNAME.localdomain  $HOSTNAME" >> /etc/hosts







printStatus "Thats all"
