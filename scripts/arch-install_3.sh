# CONFIG VARS
#
USERNAME='gargula'
EDITOR='nvim'
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
sudo nvim /etc/snapper/configs/root
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
sudo nvim /etc/pacman.conf

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
yt-dlp
lm_sensors
w3m
reflector
fish
python-pip
greetd
grub-customizer
xorg-xhost
breeze
cliphist
xarchiver
unzip
system-config-printer
usbutils
avahi
nss-mdns
nvme-cli
)



printStatus "Install Chaotic AUR Repository"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

echo '[chaotic-aur]' | sudo tee -a /etc/pacman.conf >/dev/null
echo 'Include = /etc/pacman.d/chaotic-mirrorlist' | sudo tee -a /etc/pacman.conf >/dev/null

paru


AUR_PKGS=(
cifs-utils
kitty-git
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
neofetch
swaylock-effects
starship
noto-fonts-emoji
gohugo-extended-bin
ttf-iosevka-nerd
python-pipx
wl-clip-persist-git
qmplay2-git
a2ln
)


printStatus "Install pacman packages"	
sudo pacman -S ${PACMAN_PKGS[*]}

printStatus "Install AUR Packages"

paru -S ${AUR_PKGS[*]}

printStatus "Edit Reflector Config"
sudo nvim /etc/xdg/reflector/reflector.conf


printStatus "Enable Services"
sudo systemctl enable cronie.service
sudo systemctl enable "wol@$NET_IFACE".service
sudo systemctl enable --now mpd.service
sudo systemctl enable --now reflector.service
sudo systemctl enable --now reflector.timer

printStatus "Install and Enable ZRAM Swap"
sudo cp $HOME/dotfiles/scripts/zram-swap.service /etc/systemd/system/
sudo systemctl enable --now zram-swap.service
zramctl


printStatus "Thats all"
