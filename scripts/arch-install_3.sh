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
notepadqq
ethtool
evince
cronie
gthumb
gimp
tumbler
	)


printStatus "Install Chaotic AUR Repository"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo '[chaotic-aur]' | sudo tee -a /etc/pacman.conf >/dev/null
echo 'Include = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf >/dev/null

paru


AUR_PKGS=(
dunst
fuzzel
kitty
waybar-hyprland
hyprland-git
papirus-icon-theme
thunar
thunar-archive-plugin
thunar-media-tags-plugin
thunar-volman
polkit-kde-agent
qt5-wayland
qt6-wayland
#xdg-desktop-portal-hyprland
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
wol-systemd
fastfetch
swaylock-effects
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
