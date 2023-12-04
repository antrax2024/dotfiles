USERNAME='crow'
HOSTNAME='artixBox'
EDITOR='nvim'

echo "System clock config...."
ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime
hwclock --systohc

echo "Localization..."
echo 'en_US.UTF-8 UTF-8' > /etc/locale.gen
locale-gen

echo 'LANG=en_US.UTF-8' > /etc/locale.conf

echo "vconsole.conf"
echo 'KEYMAP=br-abnt2' > /etc/vconsole.conf

echo "Network config..."
echo "$HOSTNAME" > /etc/hostname

echo "127.0.0.1   localhost
::1         localhost
127.0.1.1   $HOSTNAME.localdomain  $HOSTNAME" > /etc/hosts

echo "EDITOR=nvim..."
echo 'export EDITOR="nvim"' >> /etc/bash/bashrc
echo 'export GOPATH="$HOME/.go"' >> /etc/bash/bashrc
echo 'export GEM_HOME="$HOME/.gems"' >> /etc/bash/bashrc
echo 'export MANPAGER="nvim +Man!"' >> /etc/bash/bashrc

echo "Install Arch Linux packages support"
cp ../etc/pacman-after-chroot.conf /etc/pacman.conf
pacman-key --populate archlinux
sudo pacman -Syu

echo "Password for root..."
passwd

echo "Adduser  $USERNAME"
useradd -m $USERNAME
echo "Password for $USERNAME"
passwd $USERNAME
usermod -aG wheel $USERNAME
groupadd -r autologin
gpasswd -a $USERNAME autologin

echo "visudo"
export EDITOR='nvim'; visudo

echo "Install Network Manager, man-db, inetutils and amd-ucode"
pacman -S networkmanager networkmanager-runit network-manager-applet man-db man-pages inetutils amd-ucode


echo "Install Limine bootloader..."

pacman -S limine
mkdir -p /boot/efi/EFI/BOOT
cp /usr/share/limine/BOOTX64.EFI /boot/efi/EFI/BOOT
cp ../boot/limine.cfg /boot/
nvim /boot/limine.cfg

echo "Thats ok..."
