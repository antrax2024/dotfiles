# CONFIG VARS
#
HOSTNAME='gargulabox'
USERNAME='gargula'
EDITOR='vim'


echo 'set nu' >> /etc/vimrc
ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime
hwclock --systohc
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen
echo 'LANG=en_US.UTF-8' >> /etc/locale.conf
echo "KEYMAP=br-abnt2" >> /etc/vconsole.conf
#echo "FONT=ter-132b" >> /etc/vconsole.conf

echo "$HOSTNAME" >> /etc/hostname
echo -e "127.0.0.1\tlocalhost" >> /etc/hosts
echo -e "::1\t\tlocalhost" >> /etc/hosts 
echo -e "127.0.0.1\t$HOSTNAME.localdomain\t$HOSTNAME" >> /etc/hosts

echo "Root password..."
passwd
pacman -S grub efibootmgr networkmanager network-manager-applet dialog mtools dosfstools reflector \
  snapper bluez bluez-utils xdg-utils xdg-user-dirs alsa-utils inetutils base-devel linux-headers \
  os-prober bash-completion terminus-font nmap less blueman pipewire-jack pipewire-alsa pipewire-pulse

vim /etc/mkinitcpio.conf
vim /etc/default/grub

mkinitcpio -p linux
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable NetworkManager
systemctl enable bluetooth
systemctl enable sshd.service
useradd -mG wheel $USERNAME
passwd $USERNAME
visudo

echo "Thats ok... Reboot and go part 3..."
