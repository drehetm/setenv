# Print utilities for setenv

# Colors
RESET="\033[0m"
BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"
BOLD="\033[1m"
ITALIC="\033[3m"

# Print a header
print_header() {
  echo
  echo "${BOLD}${BLUE}==== $1 ====${RESET}"
}

# Adjusts printing style based on 'opts'
_print_conditionally() {
  local msg="$1"
  local opts="$2"

  # Print without adding a new line at the end
  if [[ "$opts" == "oneline" ]]; then
    echo -n "$msg"
    return
  fi

  echo "$msg"
}

# Print an info message
print_info() {
  local msg="${CYAN}INFO:${RESET} $1"

  _print_conditionally "$msg" "$2"
}

# Print a success message
print_success() {
  local msg="${GREEN}SUCCESS:${RESET} $1"

  _print_conditionally "$msg" "$2"
}

# Print a warning message
print_warning() {
  local msg="${YELLOW}WARNING:${RESET} $1"

  _print_conditionally "$msg" "$2"
}

# Print an error message to 'stderr'
print_error() {
  echo "${RED}ERROR:${RESET} $1" >&2
}

# Print a question
print_question() {
  echo "${MAGENTA}$1${RESET}"
}

# Print a sub-question
print_subquestion() {
  echo "${ITALIC}${MAGENTA}$1${RESET}"
}

# Print an option
print_option() {
  echo "  ${YELLOW}$1${RESET} - $2"
}

# Print a section
print_section() {
  echo
  echo "${BOLD}$1${RESET}"
  echo "${CYAN}$(printf '=%.0s' {1..50})${RESET}"
}

# Print success summary
print_success_summary() {
  echo
  echo "${CYAN}$(printf '-%.0s' {1..50})${RESET}"
  print_success "$1"
}

# Print error summary
print_error_summary() {
  echo
  echo "${RED}$(printf '-%.0s' {1..50})${RESET}"
  print_error "$1"
}

# Print a step
print_step() {
  echo "${BLUE}→${RESET} $1"
}

print_symlink() {
  local symlink_path="$1"
  local destination_path="$2"

  # -z is true if length of string next to it is zero
  if [[ -z "$destination_path" ]]; then
    destination_path=$(readlink "$symlink_path")
  fi

  echo "${GREEN}${symlink_path}${CYAN} => ${BLUE}${destination_path}${RESET}"
}

