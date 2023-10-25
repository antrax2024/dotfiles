# CONFIG VARS
#
USERNAME='gargula'
EDITOR='nvim'
NET_IFACE='enp7s0'
DOTFILES="$HOME/dotfiles"

source functions.sh
source packages.sh

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

printStatus "Upgrading...."
paru

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

printStatus "Linking /etc/nsswitch.con"
sudo ln -sf $DOTFILES/etc/nsswitch.conf /etc/nsswitch.conf

printStatus "Enable .bashrc"
rm $HOME/.bashrc
ln -sf $DOTFILES/bashrc $HOME/.bashrc

# get length of an array
arraylength=${#LINK_DIRS[@]}

printStatus "Installing Astronvim hummmmmm.... "
git clone --depth 1 https://github.com/AstroNvim/AstroNvim $HOME/.config/nvim

# use for loop to read all values and indexes
for (( i=0; i<${arraylength}; i++ ));
do
	printStatus "Linking ${LINK_DIRS[$i]}"
	ln -sf "$DOTFILES/${LINK_DIRS[$i]}" "$HOME/.config/${LINK_DIRS[$i]}"
done



printStatus "Enable Avahi Daemon Service"
sudo systemctl enable --now avahi-daemon.service

printStatus "Changind default shell to Fish Shell..."
chsh -s /usr/bin/fish $USERNAME

printStatus "Limine deploy pacman hook..."
sudo mkdir -p /etc/pacman.d/hooks
sudo ln -sf $DOTFILES/etc/pacman.d/hooks/limine-deploy.hook /etc/pacman.d/hooks/limine-deploy.hook

printStatus "linux-tkg (Kernel Custom)"
paru -S linux-tkg-bmq-headers linux-tkg-bmq modprobed-db
printStatus "Edite o arquivo limine.cfg para incluir linux-tkg e efetue um reboot para instalar nvidia.sh...."

printStatus "Config neovim..."
ln -sf $DOTFILES/nvim/ $HOME/.config/nvim/lua/user


printStatus "Link .xprofile..."
ln -sf $DOTFILES/xprofile $HOME/.xprofile

printStatus "ATIVE os cronjobs!!!"

printStatus "Thats all"
