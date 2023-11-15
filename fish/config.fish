if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
	neofetch
end

# environment
set -Ux STARSHIP_CONFIG $HOME/dotfiles/starship/starship.toml
set -Ux EDITOR 'nvim'
set -Ux GEM_HOME "$HOME/gems"
set -Ux GOPATH "$HOME/.go"
set -Ux MANPAGER 'nvim +Man!'
set -Ux DOTFILES "$HOME/dotfiles"


# Aliases
alias l='eza --git --icons -lgh'
alias la='eza --git --icons -lgha'
alias cat='bat --paging=never --theme Dracula'
alias clone='git clone'
alias p='paru --bottomup'
alias premove='paru -Rcns'

# PATH
fish_add_path $HOME/.local/bin
fish_add_path $HOME/dotfiles/bin
fish_add_path $HOME/dotfiles/nvidia-fan-control


starship init fish | source
#sysinfo
