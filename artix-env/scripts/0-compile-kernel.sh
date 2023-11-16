
echo "System clock config...."
ln -sf /usr/share/zoneinfo/America/Recife /etc/localtime
hwclock --systohc

echo "Localization..."
echo 'en_US.UTF-8 UTF-8' >> /etc/locale.gen
locale-gen

echo 'LANG=en_US.UTF-8' >> /etc/locale.conf

echo "vconsole.conf"
echo 'KEYMAP=br-abnt2' >> /etc/vconsole.conf

echo "Install Arch Linux packages support"
cp ../etc/pacman-after-chroot.conf /etc/pacman.conf
pacman-key --populate archlinux
sudo pacman -Syu

git clone https://github.com/Frogging-Family/linux-tkg.git
cd linux-tkg
nvim customization.cfg
makepkg -si
