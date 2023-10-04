# Aliases
alias l='exa -lgh'
alias la='exa -lgha'
alias cat='bat'


# environment
export STARSHIP_CONFIG=$HOME/dotfiles/starship/starship.toml
export EDITOR="vim"
export PATH="$PATH:$HOME/.local/bin:$HOME/dotfiles/bin:$HOME/.local/share/gem/ruby/3.0.0/bin"

export GEM_HOME="$HOME/gems"
#export TERM='xterm-256color'


#hummmm neofetch awww yeahhhh
neofetch


# ow yeah starship is cool
eval "$(starship init bash)"
