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
unimatrix-git
)


printStatus "Install AUR Packages"

paru -S ${AUR_PKGS[*]}


printStatus "Enable Services"
sudo systemctl enable cronie.service
sudo systemctl enable "wol@$NET_IFACE".service
sudo systemctl enable --now mpd.service

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




printStatus "Changind default shell to Fish Shell..."
chsh -s /usr/bin/fish $USERNAME

printStatus "Installing AstroNvim..."
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak
mv ~/.cache/nvim ~/.cache/nvim.bak
git clone --depth 1 https://github.com/AstroNvim/AstroNvim ~/.config/nvim
ln -sf $DOTFILES/astronvim-user $HOME/.config/nvim/lua/user

printStatus "Limine deploy pacman hook..."
mkdir -p /etc/pacman.d/hooks
sudo ln -sf $DOTFILES/etc/pacman.d/hooks/limine-deploy.hook /etc/pacman.d/hooks/limine-deploy.hook


printStatus "INSTALE O nodejs em ~/nodejs"

printStatus "Thats all"
