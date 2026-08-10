# HOME environment variable typically exists all the time
# in a Zsh shell (or most other shells), as it is set
# by the operating system for the user's environment
readonly HOME_CFG="${HOME}/.config"

# Setenv repository's path
readonly REPO_ROOT="$(pwd)"

# File defines how each symbolic link path maps to its
# destination path. Use constants from the current module
# for paths there.
readonly SYMLINK_MAPPING_FILE="scripts/datastore/symlink/mapping.txt"

