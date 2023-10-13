# CONFIG VARS
#
USERNAME='gargula'
EDITOR='nvim'
NET_IFACE='enp6s0'
DOTFILES="$HOME/dotfiles"


###############################
# Functions
function printStatus() {
	echo "$1"
	echo "..."
	sleep 2
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


printStatus "Install Chaotic AUR Repository"
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

sudo ln -sf /home/$USERNAME/dotfiles/etc/pacman.conf /etc/pacman.conf

paru

AUR_PKGS=(
cifs-utils
kitty-git
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


printStatus "Install AUR Packages"

paru -S ${AUR_PKGS[*]}

printStatus "Linking Reflector..."
sudo ln -sf /home/$USERNAME/etc/xdg/reflector/reflector.conf /etc/xdg/reflector/reflector.conf




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

printStatus "Linking gdu..."
ln -sf $DOTFILES/gdu/gdu.yaml $HOME/.gdu.yaml

printStatus "Linking /etc/environment"
sudo rm -rfv /etc/environment
sudo ln -sf $DOTFILES/etc/environment /etc/environment

printStatus "Linking /etc/greetd/config.toml"
sudo ln -sf $DOTFILES/etc/greetd/config.toml /etc/greetd/config.toml

printStatus "Linking /etc/nsswitch.con"
sudo ln -sf $DOTFILES/etc/nsswitch.conf /etc/nsswitch.conf

printStatus "Enable Greetd..."
sudo systemctl enable greetd.service

printStatus "Enable .bashrc"
rm $HOME/.bashrc
ln -sf $DOTFILES/bashrc $HOME/.bashrc


LINK_DIRS=(
	cava
	mako
	fish
	fuzzel
	hypr
	kitty
	neofetch
	swaylock
	systemd
	waybar
)

# get length of an array
arraylength=${#LINK_DIRS[@]}


# use for loop to read all values and indexes
for (( i=0; i<${arraylength}; i++ ));
do
	printStatus "Linking ${LINK_DIRS[$i]}"
	ln -sf "$DOTFILES/${LINK_DIRS[$i]}" "$HOME/.config/${LINK_DIRS[$i]}"
done


printStatus "Install Fauxmo..."
pipx install fauxmo

printStatus "Enable Avahi Daemon Service"
sudo systemctl enable --now avahi-daemon.service


printStatus "Enable a2ln notifications..."
systemctl --user enable a2ln.service

printStatus "Thats all"
