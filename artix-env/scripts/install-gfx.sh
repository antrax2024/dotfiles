# CONFIG VARS
#
USERNAME='gargula'
EDITOR='nvim'
NET_IFACE='enp7s0'
DOTFILES="$HOME/dotfiles"
SERVICE='/run/runit/service'

source functions.sh
source packages.sh

printStatus "Pacman Edit"
sudo nvim /etc/pacman.conf
printStatus "Upgrading..."
sudo pacman -Syu

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

printStatus "Install Packages"

paru -S ${PKGS[*]}


#printStatus "Enable Wake on LAN..."
#sudo systemctl enable "wol@$NET_IFACE".service


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

printStatus "Enable pipewire..."
#sudo mkdir /etc/pipewire
sudo cp /usr/share/pipewire/pipewire* /etc/pipewire/
sudo cp $DOTFILES/artix-env/etc/pipewire.conf /etc/pipewire/


printStatus "Enable bluetooth"
sudo ln -s /etc/runit/sv/bluetoothd $SERVICE

printStatus "Install fontconfig..."
./install-fonts.sh


printStatus "Install Nerd Fonts..."
mkdir -p $HOME/.local/share/fonts
cp $DOTFILES/fonts/* $HOME/.local/share/fonts
fc-cache -fv

printStatus "Enable lightdm..."
sudo cp -fv $DOTFILES/artix-env/etc/lightdm/lightdm.conf /etc/lightdm/
#sudo ln -s /etc/runit/sv/lightdm $SERVICE

printStatus "Thats all"
