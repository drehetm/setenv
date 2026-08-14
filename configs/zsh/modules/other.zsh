# TODO: split this file into more configs and source them in ../zshrc.zsh

# Enable kubectl autocompletion
source <(kubectl completion zsh)

# Enable starship prompt
eval "$(starship init zsh)"
