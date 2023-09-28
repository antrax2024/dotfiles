# CONFIG VARS
#
USERNAME='gargula'
EDITOR='vim'
NET_IFACE='enp6s0'

###############################
# Functions
function printStatus() {
	echo "$1"
	echo "..."
	sleep 3
}
###############################

printStatus "Install Snapper"
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

printStatus "Installing paru"
git clone https://aur.archlinux.org/paru.git
cd paru/
makepkg -si
cd ..
rm -rfv paru/

printStatus "Upgrading"
paru

printStatus "Edit /etc/pacman.conf"
sudo vim /etc/pacman.conf

PACMAN_PKGS=(
mpd
wget
rsync
sshfs
exa
bat
	)

AUR_PKGS=(
dunst
fuzzel
kitty
swaylock
waybar-git
hyprland-git
papirus-icon-theme
thunar
thunar-archive-plugin
thunar-media-tags-plugin
thunar-volman
polkit-kde-agent
qt5-wayland
qt6-wayland
xdg-desktop-portal-hyprland
nwg-look
snap-pac-grub
btrfs-assistant
insync
ttf-hack-nerd
siji-ng
hyprpaper
hyprshot
ttf-firacode-nerd
ttf-font-awesome
swayidle
wlogout
visual-studio-code-bin
awesome-terminal-fonts
gdu
firefox
adapta-gtk-theme
cronie
ethtool
wol-systemd
fastfetch 

	)
printStatus "Install pacman packages"	
sudo pacman -S ${PACMAN_PKGS[*]}

printStatus "Install AUR Packages"

paru -S ${AUR_PKGS[*]}

printStatus "Enable Services"
sudo systemctl enable cronie.service
sudo systemctl enable "wol@$NET_IFACE".service
sudo systemctl enable --now mpd.service

printStatus "Thats all"
