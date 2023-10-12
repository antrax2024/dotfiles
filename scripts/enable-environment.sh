DOTFILES="$HOME/dotfiles"

###############################
# Functions
function printStatus() {
	echo "$1"
	echo "..."
	sleep 2
}
###############################

printStatus "Linking gdu..."
ln -sf $DOTFILES/gdu/gdu.yaml $HOME/.gdu.yaml

printStatus "Linking /etc/environment"
sudo rm -rfv /etc/environment
sudo ln -sf $DOTFILES/etc/environment /etc/environment

printStatus "Linking vimrc.... Owww yesss!"
sudo ln -sf $DOTFILES/etc/vimrc /etc/vimrc

printStatus "Linking /etc/greetd/config.toml"
sudo ln -sf $DOTFILES/etc/greetd/config.toml /etc/greetd/config.toml

printStatus "Linking /etc/nsswitch.con"
sudo ln -sf $DOTFILES/etc/nsswitch.conf /etc/nsswitch.conf

printStatus "Enable Greetd..."
sudo systemctl enable greetd.service

printStatus "Enable .bashrc and oh-my-bash"
rm $HOME/.bashrc
ln -sf $DOTFILES/bashrc $HOME/.bashrc
ln -sf $DOTFILES/oh-my-bash $HOME/.oh-my-bash


LINK_DIRS=(
	cava
	dunst
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
	echo "${FRUITS[$i]}"
	printStatus "Linking ${LINK_DIRS[$i]}"
	ln -sf "$DOTFILES/${LINK_DIRS[$i]}" "$HOME/.config/${LINK_DIRS[$i]}"
done


printStatus "Install Fauxmo..."
pipx install fauxmo

printStatus "Enable Avahi Daemon Service"
sudo systemctl enable --now avahi-daemon.service


printStatus "Enable a2ln notifications..."
systemctl --user enable a2ln.service


printStatus "Ow yeah... Its ok baibi..."



