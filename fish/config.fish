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


# Aliases
alias l='exa -lgh'
alias la='exa -lgha'
alias cat='bat'


starship init fish | source



