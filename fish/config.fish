if status is-interactive
    # Commands to run in interactive sessions can go here
end

function fish_greeting
    neofetch
end

# environment
set -Ux STARSHIP_CONFIG $HOME/dotfiles/starship/starship.toml
set -Ux EDITOR 'vim'
set -Ux GEM_HOME "$HOME/gems"
set -Ux GOPATH "$HOME/.go"
set -Ux NODE_PATH "$HOME/nodejs/node_modules"


# Aliases
alias l='exa --git --icons -lgh'
alias la='exa --git --icons -lgha'
alias cat='bat --paging=never --theme Dracula'
alias clone='git clone'
alias p='paru --bottomup'
alias premove='paru -Rcns'
alias vim='nvim'


# PATH
fish_add_path $HOME/.local/bin
fish_add_path $HOME/dotfiles/bin
fish_add_path $HOME/nodejs/bin

starship init fish | source
