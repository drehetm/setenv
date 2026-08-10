#!/usr/bin/env zsh

# Main setup script for setenv

# Import modules
source "scripts/modules/ask.zsh"

# Source common utilities
source "scripts/modules/common/print.zsh"
source "scripts/modules/common/to_bool.zsh"

# Display welcome message
print_header "SetEnv - Environment Setup Tool"
print_info "Setting up your development environment..."

# Check if running on supported operational system
os_type="$(uname)"
if [[ "$os_type" != "Darwin" ]]; then
  print_error "This script is designed for macOS. Exiting."
  exit 1
fi

# Track if any setup step has failed
setup_failed="false"

setup_all() {
  print_section "Setting up all components..."
  "scripts/ensure_homebrew.zsh" || { setup_failed="true"; return; }
  "scripts/homebrew/install_cli_all.zsh" || setup_failed="true"
  "scripts/homebrew/install_cask_all.zsh" || setup_failed="true"
  "scripts/symlink/link_all.zsh" || setup_failed="true"
}

# Ask user which components to set up
prompt_user_for_option

# TODO - Create setup_all flow
# TODO - Define all functions that will do what I need in the defined flow
# TODO - Don't try to make it perfect, do something how you see it now, after it, iteratively redo what can be done better.
# TODO - Update all README.md docs to be relevant with the latest 'setup_all' flow.
case "$choice" in
  2)
    "scripts/ensure_homebrew.zsh" || setup_failed="true"
    ;;
  4)
    "scripts/homebrew/install_cli_all.zsh" || setup_failed="true"
    ;;
  8)
    "scripts/homebrew/install_cask_all.zsh" || setup_failed="true"
    ;;
  a|A)
    setup_all
    ;;
  q|Q)
    print_info "Exiting setup."
    exit 0
    ;;
  c|C)
    "scripts/symlink/check_all.zsh" || setup_failed="true"
    ;;
  l|L)
    "scripts/symlink/link_all.zsh" || setup_failed="true"
    ;;
  u|U)
    "scripts/symlink/unlink_all.zsh" || setup_failed="true"
    ;;
  *)
    print_error "Invalid choice. Exiting."
    exit 1
    ;;
esac

if str_to_bool $setup_failed; then
  print_error_summary "Setup failed! One or more components could not be configured properly."
  exit 1
fi

print_success_summary "Setup completed!"

