# CONFIG VARS
#
USERNAME='gargula'
EDITOR='vim'
NET_IFACE='enp6s0'



sudo umount /.snapshots
sudo rm -rfv /.snapshots
sudo snapper -c root create-config /
sudo btrfs subvolume delete /.snapshots
sudo mkdir /.snapshots
sudo mount -a
sudo chmod 750 /.snapshots/
sudo chown -R :$USERNAME /.snapshots
sudo vim /etc/snapper/configs/root
sudo systemctl enable --now snapper-timeline.timer
sudo systemctl enable --now snapper-cleanup.timer
sudo systemctl enable --now snapper-boot.timer

git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si
cd ..
rm -rfv paru/
paru
paru -S snap-pac-grub btrfs-assistant
sudo pacman -S firefox adapta-gtk-theme lxappearance cronie ethtool exa 
sudo systemctl enable cronie.service

paru -S wol-systemd lolcat fastfetch 
sudo systemctl enable "wol@$NET_IFACE".service
