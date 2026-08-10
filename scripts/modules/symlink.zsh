# Source common utilities
source "scripts/modules/common/print.zsh"
source "scripts/modules/common/fs.zsh"

# Function to check if a symbolic link exists and where it points
check_symlink() {
  local symlink_path="$1"
  local expected_dest_path="$2"

  if fsobj_symlink "$symlink_path"; then
    local real_dest_path=$(readlink "$symlink_path")

    if [[ "$real_dest_path" == "$expected_dest_path" ]]; then
      # Woohoo! Symlink is correct!
      print_info "✔ " "oneline"
      print_symlink "$symlink_path"
      return 0
    fi

    print_error "Symlink '${symlink_path}' points to '${real_dest_path}' but should point to '${expected_dest_path}'"
    return 1
  fi

  if fsobj_exists "$symlink_path"; then
    print_error "FS object exists but is not a symlink: '$symlink_path'"
    return 1
  fi

  print_error "The symlink does not exist: '$symlink_path'"
  return 1
}

# Link files
create_symlink() {
  local symlink_path="$1"
  local expected_dest_path="$2"
  local creation_status="all_right"

  # Ensure destination path exists
  if ! fsobj_exists "$expected_dest_path"; then
    print_error "Destination path does not exist: '$expected_dest_path'"
    return 1
  fi

  # Check if symlink already exists
  if fsobj_symlink "$symlink_path"; then
    local real_dest_path=$(readlink "$symlink_path")

    if [[ "$real_dest_path" == "$expected_dest_path" ]]; then
      # Woohoo! Symlink already exists! Do nothing.
      print_info "✔ " "oneline"
      print_symlink "$symlink_path"
      return 0
    fi

    # Existent symlink points to wrong destination
    print_warning "Symlink exists but it points to wrong destination. " "oneline"
    print_symlink "$symlink_path"

    read -q "choice?Overwrite? y/n? "
    echo

    if [[ "$choice" == "n" ]]; then
      # Do not overwrite
      print_warning "Skipped."
      return 0
    fi

    creation_status="overwrite_symlink"

  elif fsobj_exists "$symlink_path"; then
    # Existent filesystem object is not a symlink
    print_warning "Filesystem object exists but it's not a symlink: '$symlink_path'"

    read -q "choice?Overwrite? y/n? "
    echo

    if [[ "$choice" == "n" ]]; then
      # Do not overwrite
      print_warning "Skipped."
      return 0
    fi

    creation_status="overwrite_fsobj"

  fi

  # Create parent directory if needed
  local parent_dir=$(dirname "$symlink_path")
  ensure_dir "$parent_dir"

  # Create symlink
  ln -sf "$expected_dest_path" "$symlink_path" || creation_status="ln_failed"

  case "$creation_status" in
    overwrite_symlink)
      print_success "Existent symlink is overwritten with the new one. " "oneline"
      print_symlink "$symlink_path"
      return 0
      ;;
    overwrite_fsobj)
      print_success "Filesystem object is overwritten with symlink. " "oneline"
      print_symlink "$symlink_path"
      return 0
      ;;
    ln_failed)
      print_error "Shell's 'ln' command has failed for: '$symlink_path'"
      return 1
      ;;
  esac

  print_success "Symlink created. " "oneline"
  print_symlink "$symlink_path"
  return 0
}

remove_symlink() {
  local symlink_path="$1"
  local expected_dest_path="$2"

  if fsobj_exists "$symlink_path" && ! fsobj_symlink "$symlink_path"; then
    print_error "Skipped. Path exists but is not a symlink: '${symlink_path}'"
    return 1
  fi

  if ! fsobj_symlink "$symlink_path"; then
    print_info "✘ " "oneline"
    print_symlink "$symlink_path" "nil"
    return 0
  fi

  local real_dest_path=$(readlink "$symlink_path")

  if [[ "$real_dest_path" != "$expected_dest_path" ]]; then
    # Existent symlink points to wrong destination
    print_warning "Symlink exists but it points to wrong destination. " "oneline"
    print_symlink "$symlink_path"

    read -q "choice?Delete anyway? y/n? "
    echo

    if [[ "$choice" == "n" ]]; then
      # Do not delete symlink
      print_warning "Skipped."
      return 0
    fi
  fi

  rm "$symlink_path"

  if (( $? != 0 )); then
    print_error "Shell's 'rm' command has failed for: '${symlink_path}'"
    return 1
  fi

  print_success "Symlink removed. " "oneline"
  print_symlink "$symlink_path" "$expected_dest_path"
  return 0
}

