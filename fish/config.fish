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
alias l='exa --git --icons -lgh'
alias la='exa --git --icons -lgha'
alias cat='bat --theme Dracula'
alias clone='git clone'


# PATH

fish_add_path $HOME/.local/bin
fish_add_path $HOME/dotfiles/bin
fish_add_path $HOME/.local/share/gem/ruby/3.0.0/bin


starship init fish | source
