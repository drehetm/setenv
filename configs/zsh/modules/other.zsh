# TODO: split this file into more configs and source them in ../zshrc.zsh

# Set terminal's default text editor
export EDITOR=nvim

# GCP installation
# ==> Source [/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc] in your profile to enable shell command completion for gcloud.
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc
# ==> Source [/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc] in your profile to add the Google Cloud SDK command line tools to your $PATH.
source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

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

