DOTFILES="$HOME/dotfiles"

###############################
# Functions
function printStatus() {
	echo "$1"
	echo "..."
	sleep 3
}
###############################

printStatus "Linking /etc/environment"
sudo rm -rfv /etc/environment
sudo ln -sf $DOTFILES/etc/environment /etc/environment


printStatus "Enable .bashrc and oh-my-bash"
rm $HOME/.bashrc
ln -sf $DOTFILES/bashrc $HOME/.bashrc
ln -sf $DOTFILES/oh-my-bash $HOME/.oh-my-bash


LINK_DIRS=(
	cava
	dunst
	fuzzel
	hypr
	kitty
	swaylock
	waybar
	neofetch
	fish
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


printStatus "Enable Fauxmo..."

pipx install fauxmo


