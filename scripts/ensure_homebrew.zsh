#!/usr/bin/env zsh

# Ensure that Homebrew is installed

# Source common utilities
source "scripts/modules/common/print.zsh"
source "scripts/modules/common/app.zsh"

# TODO - check if Homebrew is installed
# - 'true' then run `brew update`
# - 'false' - show message with the link [how to install](https://brew.sh/)
if ! cli_app_exists "brew"; then
  # TODO - rephrase error message text
  print_error "Homebrew is not installed. Please install it first. See how to do it [here](https://brew.sh/)"
    exit 1
fi
exit 0

# TODO - refactor everything defined below
print_header "Homebrew Setup"

# Check if Homebrew is installed
if ! command -v brew &>/dev/null; then
    print_error "Homebrew is not installed. Please install it first."
    exit 1
fi

print_info "Homebrew found: $(brew --version | head -n 1)"

print_step "Updating Homebrew..."
brew update
print_success "Homebrew has been updated successfully!"

