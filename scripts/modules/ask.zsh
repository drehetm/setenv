# Source common utilities
source "scripts/modules/common/print.zsh"

# Ask user which components to set up
prompt_user_for_option() {
  print_question "Which components would you like to set up?"
  print_option "2" "Ensure Homebrew is installed"
  print_option "4" "Install all CLI apps"
  print_option "8" "Install all 'Casks'"
  print_option "a" "All of the above"
  print_option "q" "Quit"
  # New style combo options
  print_subquestion "... or choose one of the new style combo-options:"
  print_option "c" "Check ALL symlinks for existance"
  print_option "l" "Link ALL symlinks with setenv configs"
  print_option "u" "Unlink ALL symlinks from setenv configs"

  read -r "choice?Enter your choice: "
}

