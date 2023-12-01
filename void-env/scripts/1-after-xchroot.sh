EDITOR='nvim'


echo "visudo"
export EDITOR='nvim'; visudo

echo "Install Limine bootloader..."

xbps-install limine neovim fish-shell void-repo-nonfree curl wget
mkdir -p /boot/efi/EFI/BOOT
cp /usr/share/limine/BOOTX64.EFI /boot/efi/EFI/BOOT
cp ../boot/limine.cfg /boot/
nvim /boot/limine.cfg

echo "Delete wheel file ...."
rm /etc/sudoers.d/wheel

echo "Thats ok..."
