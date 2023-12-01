# CONFIG VARS
#
USERNAME=$USER
EDITOR='nvim'
DOTFILES="$HOME/dotfiles"
DESTINATION='/var/service'
SOURCE='/etc/sv'
VOID_ENV="$HOME/dotfiles/void-env"


source $DOTFILES/bin/functions.sh
source ./packages.sh

printStatus "Upgrading..."
sudo xbps-install -Su

printStatus "Install NON-Free repositories support.... "
sudo xbps-install void-repo-nonfree

printStatus "Updating  again  ooowwww..."
sudo xbps-install -Su



printStatus "Install Packages"
sudo xbps-install $PKGS


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
chsh -s $(which fish) $USERNAME

printStatus "Enable openSSH..."
sudo ln -s $SOURCE/sshd $DESTINATION

printStatus "Enable bluetooth"
sudo ln -s $SOURCE/bluetoothd $DESTINATION

printStatus "Enable cronie..."
sudo ln -s $SOURCE/cronie $DESTINATION


printStatus "Enable Swap File... Hummmmmm"
sudo fallocate -l 4G /swapfile
sudo chmod 600 /swapfile
sudo mkswap /swapfile
sudo swapon /swapfile
echo '# Swapfile' | sudo tee --append /etc/fstab
echo '/swapfile none swap defaults 0 0' | sudo tee --append /etc/fstab

printStatus "Link vfio and blacklist..."
sudo ln -sf $VOID_ENV/etc/modprobe.d/vfio.conf /etc/modprobe.d/vfio.conf
sudo ln -sf $VOID_ENV/etc/modprobe.d/blacklist.conf /etc/modprobe.d/blacklist.conf

printStatus "Regenerating kernel image.... hooowwwww!!! Ow yues,,, yes man yesssss!!!!"
sudo xbps-reconfigure --force linux

printStatus "Enable cupsd Print Service..."
sudo ln -s $SOURCE/cupsd $DESTINATION

printStatus "Enable Avahi Service..."
sudo ln -s $SOURCE/avahi-daemon $DESTINATION

printStatus "Enable dbus service..."
sudo ln -s $SOURCE/dbus $DESTINATION

printStatus "Hummmmmmmm......"


