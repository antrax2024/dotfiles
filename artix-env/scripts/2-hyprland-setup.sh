# CONFIG VARS
#
USERNAME='gargula'
EDITOR='nvim'
DOTFILES="$HOME/dotfiles"
SERVICE='/run/runit/service'
SV_DST='/run/runit/service'
SV_SCR='/etc/runit/sv'
ARTIX_ENV="$DOTFILES/artix-env"



source $DOTFILES/bin/functions.sh
source ./packages.sh

printStatus "Upgrading..."
sudo pacman -Syu

printStatus "Linking mkinitcpio.conf"
sudo ln -sf $DOTFILES/artix-env/etc/mkinitcpio.conf /etc/mkinitcpio.conf

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
	sudo ln -sf "$DOTFILES/${LINK_DIRS[$i]}" "$HOME/.config/${LINK_DIRS[$i]}"
done

printStatus "Changind default shell to Fish Shell..."
chsh -s /usr/bin/fish $USERNAME

printStatus "Enable Services..."
arraylength=${#SERVICES[@]}
# use for loop to read all values and indexes
for (( i=0; i<${arraylength}; i++ ));
do
	printStatus "Link ${SERVICES[$i]}"
	ln -s $SV_SCR/${SERVICES[$i]} $SV_DST
done

printStatus "Enable Swap File... Hummmmmm"
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '# Swapfile' | sudo tee --append /etc/fstab
echo '/swapfile none swap defaults 0 0' | sudo tee --append /etc/fstab

printStatus "Link /boot/limine.cfg"
sudo ln -sf $DOTFILES/artix-env/boot/limine.cfg /boot/limine.cfg
nvim /boot/limine.cfg

printStatus "Link vfio and blacklist..."
sudo ln -sf $DOTFILES/artix-env/etc/modprobe.d/vfio.conf /etc/modprobe.d/vfio.conf
sudo ln -sf $DOTFILES/artix-env/etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf

printStatus "Linking /etc/environment..."
sudo ln -sf $DOTFILES/artix-env/etc/environment /etc/environment

printStatus "Generating kernel image...."
sudo mkinitcpio -p linux-zen

printStatus "Linking greetd..."
sudo ln -sf $DOTFILES/artix-env/etc/greetd/config.toml /etc/greetd/config.toml

printStatus "Dont forget to enable greetd... Bye.."



