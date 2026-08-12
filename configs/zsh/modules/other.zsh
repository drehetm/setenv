# TODO: split this file into more configs and source them in ../zshrc.zsh

# Set terminal's default text editor
export EDITOR=nvim

# Enable kubectl autocompletion
source <(kubectl completion zsh)

# Enable iTerm2 shell integration
source "${HOME}/.iterm2_shell_integration.zsh"

# Enable starship prompt
eval "$(starship init zsh)"

# Change default autoenv file name
export AUTOENV_ENV_FILENAME=".autoenv"
export AUTOENV_ENV_LEAVE_FILENAME=".autoenv_leave"
export AUTOENV_ENABLE_LEAVE=yes
# Enable autoenv tool
source /opt/homebrew/opt/autoenv/activate.sh

