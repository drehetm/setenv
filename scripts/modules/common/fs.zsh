# File system utilities for setenv
#
# To find more information on how to test attributes of files see the
# [link](https://zsh.sourceforge.io/Doc/Release/Conditional-Expressions.html)

# Source print utilities
source "scripts/modules/common/print.zsh"

# Check if a directory exists
dir_exists() {
  if [[ -d "$1" ]]; then
    return 0
  else
    return 1
  fi
}

# Create a directory if it doesn't exist
ensure_dir() {
  if ! dir_exists "$1"; then
    print_info "Creating directory: $1"
    mkdir -p "$1"
  fi
}

# Check if $1 exists and is a regular file
file_exists() {
  if [[ -f "$1" ]]; then
    return 0
  else
    return 1
  fi
}

# Check if filesystem object exists: file, directory, or other filesystem object
fsobj_exists() {
  if [[ -e "$1" ]]; then
    return 0
  else
    return 1
  fi
}

# Check if filesystem object exists and is a symbolic link
fsobj_symlink() {
  if [[ -L "$1" ]]; then
    return 0
  else
    return 1
  fi
}

