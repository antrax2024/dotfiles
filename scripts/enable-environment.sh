# CONFIG VARS
#
USERNAME='gargula'
EDITOR='nvim'
NET_IFACE='enp7s0'
DOTFILES="$HOME/dotfiles"

source functions.sh
source packages.sh

printStatus "Upgrading"
paru

printStatus "Linking environment and profile to /etc"
sudo ln -sf $DOTFILES/etc/environment /etc/environment
sudo ln -sf $DOTFILES/etc/profile /etc/profile


printStatus "Install Packages"

paru -S ${PKGS[*]}


printStatus "Enable Wake on LAN..."
sudo systemctl enable "wol@$NET_IFACE".service


printStatus "Enable .bashrc"
rm $HOME/.bashrc
ln -sf $DOTFILES/bashrc $HOME/.bashrc

# get length of an array
arraylength=${#LINK_DIRS[@]}

printStatus "Installing Astronvim hummmmmm.... "
verifyIfConfigExists "nvim"
git clone --depth 1 https://github.com/AstroNvim/AstroNvim $HOME/.config/nvim
printStatus "Config neovim..."
#ln -sf $DOTFILES/nvim/ $HOME/.config/nvim/lua/user
ln -sf /home/gargula/dotfiles/nvim /home/gargula/.config/nvim/lua/user

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
sudo systemctl enable --now sshd.service

printStatus "bashrc for root... ow yes man!"
sudo ln -sf $DOTFILES/scripts/bashrc-root /root/.bashrc

printStatus "Disable ipv6 for local network...."
sudo ln -sf $DOTFILES/etc/sysctl.d/40-ipv6.conf /etc/sysctl.d/40-ipv6.conf

printStatus "Link mkinitcpio..."
sudo ln -sf $DOTFILES/etc/mkinitcpio.conf /etc/mkinitcpio.conf

printStatus "Thats all"
