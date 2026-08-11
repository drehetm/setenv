# Initialize Homebrew in user's shell environment so that it works correctly
eval "$(/opt/homebrew/bin/brew shellenv)"

# Added by `rbenv init` on Mon Apr  7 22:02:53 CEST 2025
eval "$(rbenv init - --no-rehash zsh)"

# Import machine's specific environment variables
source "${HOME}/.setenv_cfg"

