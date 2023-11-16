# CONFIG VARS
#
USERNAME='gargula'
EDITOR='nvim'
DOTFILES="$HOME/dotfiles"
SERVICE='/run/runit/service'

source $DOTFILES/bin/functions.sh
source $DOTFILES/bin/packages-artix-hyprland.sh

printStatus "Upgrading..."
sudo pacman -Syu


printStatus "Linking mkinitcpio.conf"
sudo ln -sf $DOTFILES/artix-env/etc/mkinitcpio.conf /etc/mkinitcpio.conf
sudo mkinitcpio -p linux-zen

printStatus "Install paru..."
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
cd ../
rm -rfv paru

printStatus "Enable Chaotic-AUR..."
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' 
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' 

sudo sed -i -e '$a[chaotic-aur]' /etc/pacman.conf
sudo sed -i -e '$aInclude = /etc/pacman.d/chaotic-mirrorlist' /etc/pacman.conf

paru

printStatus "Install dependencies for hyprland..."
paru -S gdb ninja gcc cmake meson libxcb xcb-proto xcb-util xcb-util-keysyms libxfixes libx11 libxcomposite xorg-xinput libxrender pixman wayland-protocols cairo pango seatd libxkbcommon xcb-util-wm xorg-xwayland libinput libliftoff libdisplay-info cpio

printStatus "Install Packages"

paru -S ${PKGS[*]}


printStatus "Prepare to link..."
# get length of an array
arraylength=${#LINK_DIRS[@]}

mkdir $HOME/.config

# use for loop to read all values and indexes
for (( i=0; i<${arraylength}; i++ ));
do
	printStatus "Linking ${LINK_DIRS[$i]}"
	verifyIfConfigExists "${LINK_DIRS[$i]}"
	ln -sf "$DOTFILES/${LINK_DIRS[$i]}" "$HOME/.config/${LINK_DIRS[$i]}"
done

printStatus "Changind default shell to Fish Shell..."
chsh -s /usr/bin/fish $USERNAME

printStatus "Enable openSSH..."
sudo ln -s /etc/runit/sv/sshd $SERVICE

printStatus "Enable bluetooth"
sudo ln -s /etc/runit/sv/bluetoothd $SERVICE

printStatus "Enable cronie..."
sudo ln -s /etc/runit/sv/cronie $SERVICE

printStatus "Enable NTP Sync"
sudo ln -s /etc/runit/sv/ntpd /run/runit/service

printStatus "Enable Swap File... Hummmmmm"
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '# Swapfile' | sudo tee --append /etc/fstab
echo '/swapfile none swap defaults 0 0' | sudo tee --append /etc/fstab

printStatus "Enable greetd..."
sudo ln -sf $DOTFILES/artix-env/etc/greetd/config.toml /etc/greetd/config.toml




printStatus "Thats all"
