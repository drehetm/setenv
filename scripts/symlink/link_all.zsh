#!/usr/bin/env zsh

# Import modules
source "scripts/modules/symlink.zsh"

# Source common utilities
source "scripts/modules/common/print.zsh"
source "scripts/modules/common/to_bool.zsh"
source "scripts/datastore/common/constants.zsh"

print_section "Link all symlinks"

echo "Legend:"
echo "✔ - Means that the correct symlink already exists."
echo

# The parenthesis set-up a sub-environment. After
# exiting them $IFS variable will be restored to the
# default system's setting.
(
  # Track if any link operation has failed
  linking_failed="false"

  # Redefine $IFS to use it for splitting the line from a file
  IFS=":"
  # Read one line and break it into fields using the characters in $IFS as separators
  while read -r symlink_path destination_path; do
    # -z is true if length of string next to it is zero
    if [[ -z "$symlink_path" || -z "$destination_path" ]]; then
      continue
    fi

    # Expand variables in paths to make paths absolute
    symlink_path="${(e)symlink_path}"
    destination_path="${(e)destination_path}"

    create_symlink "$symlink_path" "$destination_path" || linking_failed="true"
  done < "$SYMLINK_MAPPING_FILE"

  if str_to_bool $linking_failed; then
    exit 1
  fi
) || exit 1

