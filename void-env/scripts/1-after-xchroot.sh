EDITOR='nvim'


echo "visudo"
export EDITOR='nvim'; visudo

echo "Install Limine bootloader..."

xbps-install limine neovim fish-shell void-repo-nonfree
mkdir -p /boot/efi/EFI/BOOT
cp /usr/share/limine/BOOTX64.EFI /boot/efi/EFI/BOOT
cp ../boot/limine.cfg /boot/
nvim /boot/limine.cfg

echo "Thats ok..."
